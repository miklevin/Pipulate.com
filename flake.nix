{
  description = "Nix flake for Jekyll environment with Rouge for syntax highlighting and Bundler support";

  inputs = {
    # Use a stable Nixpkgs version. Update this to a newer version if needed.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Optionally, specify the flake-utils for multi-system support
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        pythonEnv = pkgs.python3.withPackages (ps: with ps; [
          requests
          simplenote
          # Add other Python packages needed for your project here
        ]);
      in
      {
        # Define the development shell
        devShells.default = pkgs.mkShell {
          # Include necessary packages in the PATH
          buildInputs = [
            pkgs.ruby                       # Ruby for Jekyll and Bundler
            pkgs.jekyll                     # Jekyll from Nixpkgs
            pkgs.rubyPackages_3_2.rouge     # Rouge (provides rougify)
            pkgs.neovim                     # Neovim for text editing
            pkgs.git                        # Git for version control
            pythonEnv                       # Use the Python environment defined above
            pkgs.stdenv.cc.cc.lib          # Add C++ standard library
            pkgs.pkg-config                 # Add pkg-config for build dependencies
            pkgs.openssl                    # Add openssl for native gem compilation
            pkgs.zlib                       # Add zlib for nokogiri
            pkgs.libffi                     # Add libffi for ffi gem
            pkgs.libxml2                    # Add libxml2 for nokogiri
            pkgs.libxslt                    # Add libxslt for nokogiri
          ];

          # Set environment variables for native gem compilation
          shellHook = ''
            export GEM_HOME=$PWD/.gem
            export GEM_PATH=$GEM_HOME
            export PATH=$GEM_HOME/bin:$PATH
            
            # Set Ruby-related environment variables
            export BUNDLE_FORCE_RUBY_PLATFORM=1
            
            # Add Ruby library path to LD_LIBRARY_PATH
            export LD_LIBRARY_PATH="${pkgs.ruby}/lib:${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH"
            
            # Add all necessary libraries to LD_LIBRARY_PATH
            export LD_LIBRARY_PATH="${pkgs.libffi}/lib:$LD_LIBRARY_PATH"
            export LD_LIBRARY_PATH="${pkgs.zlib}/lib:$LD_LIBRARY_PATH"
            export LD_LIBRARY_PATH="${pkgs.libxml2}/lib:$LD_LIBRARY_PATH"
            export LD_LIBRARY_PATH="${pkgs.libxslt}/lib:$LD_LIBRARY_PATH"
            
            # Set up pkg-config path
            export PKG_CONFIG_PATH="${pkgs.zlib.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
            export PKG_CONFIG_PATH="${pkgs.libffi.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
            export PKG_CONFIG_PATH="${pkgs.libxml2.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
            export PKG_CONFIG_PATH="${pkgs.libxslt.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
            
            # Install a compatible version of bundler if not present
            if ! gem list -i bundler > /dev/null 2>&1; then
              echo "Installing bundler..."
              gem install bundler --no-document
            fi

            # Configure bundler to install gems locally to .gem directory
            bundle config set --local path "$GEM_HOME"
            
            # Configure build options for native extensions
            bundle config build.nokogiri --use-system-libraries
            bundle config build.ffi --enable-system-libffi
            bundle config build.eventmachine --with-cflags="-I${pkgs.openssl.dev}/include"
            
            # Force rebuilding native extensions
            bundle config set force_ruby_platform true

            export BUNDLE_BUILD__EVENTMACHINE="--with-cflags=-I${pkgs.openssl.dev}/include"
            export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
            
            # macOS-specific symlink setup for Neovim
            if [ "$(uname)" = "Darwin" ]; then
              echo "Detected macOS. Setting up Neovim configuration."
              CONFIG_DIR="$HOME/Library/Application Support/nvim"
              INIT_LUA_SOURCE="$HOME/repos/nixos/init.lua"
              INIT_LUA_TARGET="$CONFIG_DIR/init.lua"

              mkdir -p "$CONFIG_DIR"
              ln -sf "$INIT_LUA_SOURCE" "$INIT_LUA_TARGET"
              echo "Symlink created: $INIT_LUA_TARGET -> $INIT_LUA_SOURCE"
            else
              echo "Linux detected. Skipping Neovim setup as it's not needed."
            fi

            # Alias vim to nvim
            alias vim=nvim

            # Jekyll serve function with verbose output and livereload
            jes() {
              # Store the current directory
              current_dir=$(pwd)
              
              # Find the Jekyll root (where Gemfile exists)
              site_root="$current_dir"
              while [[ "$site_root" != "/" && ! -f "$site_root/Gemfile" ]]; do
                site_root="$(dirname "$site_root")"
              done

              if [[ ! -f "$site_root/Gemfile" ]]; then
                echo "Error: Could not find Gemfile. Are you in a Jekyll site directory?"
                return 1
              fi

              # Kill any running Jekyll processes
              echo "Stopping any existing Jekyll servers..."
              pkill -f "jekyll serve" || true
              
              # Give processes time to terminate
              sleep 1
              
              # Change to the site root
              cd "$site_root"
              echo "Serving from $(pwd)..."
              RUBYOPT="-W0" bundle exec jekyll serve --verbose --incremental
              
              # Return to the original directory
              cd "$current_dir"
            }

            # Function to clean and rebuild native extensions
            rebuild-gems() {
              echo "Rebuilding native gem extensions..."
              
              # Check for problematic gems
              for gem in json ffi nokogiri; do
                if [ -d "$GEM_HOME/gems/$gem"* ]; then
                  gem_path=$(find "$GEM_HOME/gems" -name "$gem*" -type d | head -1)
                  if [ -n "$gem_path" ]; then
                    echo "Rebuilding $gem extension..."
                    cd "$gem_path"
                    
                    # Clean the extension
                    if [ -f "ext/*/Makefile" ]; then
                      cd ext/*/ && make clean || true
                      cd ../../
                    fi
                    
                    # Rebuild with the correct library path
                    RUBYOPT="-W0" gem build *.gemspec && \
                    RUBYOPT="-W0" gem install *.gem --local --no-document
                  fi
                fi
              done
              
              echo "Gem rebuild complete."
              cd "$OLDPWD"
            }

            # Function to completely reset and rebuild the Ruby environment
            reset-ruby-env() {
              echo "This will completely reset your Ruby environment."
              echo "Backing up your Gemfile and Gemfile.lock..."
              
              cp Gemfile Gemfile.backup
              if [ -f Gemfile.lock ]; then
                cp Gemfile.lock Gemfile.lock.backup
              fi
              
              echo "Removing .gem directory..."
              rm -rf .gem
              
              echo "Recreating Ruby environment..."
              export GEM_HOME=$PWD/.gem
              export GEM_PATH=$GEM_HOME
              export PATH=$GEM_HOME/bin:$PATH
              
              echo "Installing bundler..."
              gem install bundler --no-document
              
              echo "Setting bundler config..."
              bundle config set --local path "$GEM_HOME"
              bundle config build.nokogiri --use-system-libraries
              bundle config build.ffi --enable-system-libffi
              bundle config build.eventmachine --with-cflags="-I${pkgs.openssl.dev}/include"
              # Force native platform for all gems
              bundle config set force_ruby_platform true
              
              echo "Installing gems (this may take a while)..."
              BUNDLE_FORCE_RUBY_PLATFORM=1 RUBYOPT="-W0" bundle install
              
              echo "Ruby environment has been reset and rebuilt."
              echo "You can now try running 'jes' again."
            }

            # Function to stop any running Jekyll servers
            jes-stop() {
              echo "Stopping all Jekyll servers..."
              pkill -f "jekyll serve" || echo "No Jekyll servers found running."
              echo "Done."
            }

            # Check if the Ruby environment is properly set up
            if [ ! -d .gem ] || [ ! -f .gem/bin/bundler ]; then
              echo "Ruby environment not found or incomplete. Setting up..."
              reset-ruby-env
            else
              echo "Jekyll and Rouge environments are ready."
              echo "Instructions:"
              echo "1. Run: bundle install (if needed)"
              echo "2. Run: jes (to start Jekyll server)"
              echo "3. Run: jes-stop (to stop any running Jekyll servers)"
              echo "4. If you encounter library errors, run: rebuild-gems"
              echo "5. If you still have issues, run: reset-ruby-env"
              echo "6. Generate Rouge styles: rougify style monokai.sublime > assets/css/syntax.css"
              echo ""
              echo "Note: Gems will now install into $GEM_HOME"
            fi
          '';
        };
      });
}
