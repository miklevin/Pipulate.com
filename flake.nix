# Jekyll Environment Setup for Nix
# ==============================
# This flake provides a complete development environment for Jekyll sites with:
# - Ruby and Jekyll with all necessary dependencies
# - Rouge for syntax highlighting
# - Python environment for additional tools
# - Neovim for text editing
# - Git for version control
# - Automatic Jekyll server startup on environment entry
#
# Environment Variables
# -------------------
# The environment is configured with the following key variables:
# - GEM_HOME: Local gem installation directory (.gem)
# - GEM_PATH: Path to find gems
# - BUNDLE_FORCE_RUBY_PLATFORM: Forces native gem compilation
# - LD_LIBRARY_PATH: Paths to required system libraries
# - PKG_CONFIG_PATH: Paths for pkg-config to find build dependencies
#
# Available Commands
# ----------------
# 1. jes: Start Jekyll server with automatic environment checks
#    - Checks Ruby version compatibility
#    - Ensures all gems are installed
#    - Handles port configuration
#    - Provides verbose output and incremental builds
#    - AUTOMATICALLY CALLED when entering nix develop
#
# 2. jes-stop: Stop any running Jekyll servers
#
# 3. rebuild-gems: Clean and rebuild native gem extensions
#    - Targets problematic gems (json, ffi, nokogiri)
#    - Rebuilds with correct library paths
#
# 4. reset-ruby-env: Complete Ruby environment reset
#    - Backs up Gemfile and Gemfile.lock
#    - Removes .gem directory
#    - Reinstalls bundler and all gems
#
# Common Issues and Solutions
# -------------------------
# 1. Ruby Version Mismatch:
#    - Detected by check_ruby_version function
#    - Automatically rebuilds affected gems
#    - Specifically handles ffi_c.so version mismatches
#
# 2. Missing Gems:
#    - Detected by bundle check
#    - Automatically installs missing gems
#    - Configures bundler for local installation
#
# 3. Native Extension Issues:
#    - Use rebuild-gems to rebuild problematic extensions
#    - System libraries are properly linked via LD_LIBRARY_PATH
#    - Build options configured for common problematic gems
#
# Best Practices
# -------------
# 1. Always run nix develop from the Jekyll site root
# 2. Use .port file to configure custom ports
# 3. Keep Gemfile and Gemfile.lock in version control
# 4. Run reset-ruby-env for major environment issues
# 5. Use rebuild-gems for specific gem issues
# 6. Jekyll server starts automatically on environment entry
#
# Version History
# --------------
# v1.0.6: Added automatic Jekyll server startup on environment entry
# v1.0.5: Added bundle exec for Jekyll checks
# v1.0.4: Improved error handling and diagnostics
# v1.0.3: Fixed environment variable handling
# v1.0.2: Added version number and improved checks
# v1.0.1: Initial version with basic functionality

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
        # Python environment with required packages
        pythonEnv = pkgs.python3.withPackages (ps: with ps; [
          requests
          simplenote
          # Add other Python packages needed for your project here
        ]);
      in
      {
        # Define the development shell with all necessary dependencies
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

          # Set environment variables and define helper functions
          shellHook = ''
            # Set up Ruby environment variables
            export GEM_HOME=$PWD/.gem
            export GEM_PATH=$GEM_HOME
            export PATH=$GEM_HOME/bin:$PATH
            
            # Force native gem compilation
            export BUNDLE_FORCE_RUBY_PLATFORM=1
            
            # Set up library paths for native extensions
            export LD_LIBRARY_PATH="${pkgs.ruby}/lib:${pkgs.stdenv.cc.cc.lib}/lib:$LD_LIBRARY_PATH"
            export LD_LIBRARY_PATH="${pkgs.libffi}/lib:$LD_LIBRARY_PATH"
            export LD_LIBRARY_PATH="${pkgs.zlib}/lib:$LD_LIBRARY_PATH"
            export LD_LIBRARY_PATH="${pkgs.libxml2}/lib:$LD_LIBRARY_PATH"
            export LD_LIBRARY_PATH="${pkgs.libxslt}/lib:$LD_LIBRARY_PATH"
            
            # Configure pkg-config paths for build dependencies
            export PKG_CONFIG_PATH="${pkgs.zlib.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
            export PKG_CONFIG_PATH="${pkgs.libffi.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
            export PKG_CONFIG_PATH="${pkgs.libxml2.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
            export PKG_CONFIG_PATH="${pkgs.libxslt.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
            
            # Install bundler if not present
            if ! gem list -i bundler > /dev/null 2>&1; then
              echo "Installing bundler..."
              gem install bundler --no-document
            fi

            # Configure bundler for local gem installation
            bundle config set --local path "$GEM_HOME"
            
            # Set build options for problematic native extensions
            bundle config build.nokogiri --use-system-libraries
            bundle config build.ffi --enable-system-libffi
            bundle config build.eventmachine --with-cflags="-I${pkgs.openssl.dev}/include"
            bundle config set force_ruby_platform true

            # Additional build configuration
            export BUNDLE_BUILD__EVENTMACHINE="--with-cflags=-I${pkgs.openssl.dev}/include"
            export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig:$PKG_CONFIG_PATH"
            
            # macOS-specific Neovim configuration
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

            # Jekyll serve function with automatic environment checks
            jes() {
              echo "Jekyll Environment Script v1.0.6"
              
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

              # Read port from .port file or use default
              if [ -f "$site_root/.port" ]; then
                port=$(cat "$site_root/.port")
                echo "Using port $port from .port file"
              else
                port=4000
                echo "No .port file found, using default port $port"
              fi

              # Function to check for Ruby version mismatch
              check_ruby_version() {
                echo "Checking Ruby environment..."
                
                # Save current environment
                local old_gem_home="$GEM_HOME"
                local old_gem_path="$GEM_PATH"
                local old_path="$PATH"
                local old_bundle_gemfile="$BUNDLE_GEMFILE"
                local old_bundle_path="$BUNDLE_PATH"
                
                # Set environment for checks
                export GEM_HOME="$site_root/.gem"
                export GEM_PATH="$GEM_HOME"
                export PATH="$GEM_HOME/bin:$PATH"
                export BUNDLE_GEMFILE="$site_root/Gemfile"
                export BUNDLE_PATH="$GEM_HOME"
                
                # First check if jekyll binary exists
                if [ ! -f "$site_root/.gem/ruby/3.3.0/bin/jekyll" ]; then
                  echo "Jekyll binary not found. Will need to install gems."
                  return 1
                fi
                
                # Try to run jekyll with --version and capture both stdout and stderr
                local jekyll_output
                jekyll_output=$(cd "$site_root" && bundle exec jekyll --version 2>&1)
                local jekyll_status=$?
                
                if [ $jekyll_status -ne 0 ]; then
                  echo "Jekyll binary check failed with status $jekyll_status"
                  echo "Error output: $jekyll_output"
                  
                  if echo "$jekyll_output" | grep -q "incompatible library version"; then
                    echo "Detected Ruby version mismatch. Rebuilding gems..."
                    rm -rf "$site_root/.gem"
                    return 1
                  else
                    echo "Unknown Jekyll error. Rebuilding gems..."
                    rm -rf "$site_root/.gem"
                    return 1
                  fi
                fi
                
                # Check for specific Ruby version mismatch in ffi_c.so
                if [ -f "$site_root/.gem/ruby/3.3.0/gems/ffi-1.17.1/lib/ffi_c.so" ]; then
                  local ffi_libs
                  ffi_libs=$(ldd "$site_root/.gem/ruby/3.3.0/gems/ffi-1.17.1/lib/ffi_c.so" 2>&1)
                  if echo "$ffi_libs" | grep -q "libruby-3.3.7"; then
                    echo "Detected Ruby 3.3.7 vs 3.3.8 mismatch in ffi_c.so. Rebuilding ffi gem..."
                    rm -rf "$site_root/.gem/ruby/3.3.0/gems/ffi-1.17.1"
                    rm -rf "$site_root/.gem/ruby/3.3.0/specifications/ffi-1.17.1.gemspec"
                    return 1
                  fi
                fi

                # Check if bundle check passes
                local bundle_output
                bundle_output=$(cd "$site_root" && bundle check 2>&1)
                local bundle_status=$?
                
                if [ $bundle_status -ne 0 ]; then
                  echo "Bundle check failed with status $bundle_status"
                  echo "Error output: $bundle_output"
                  echo "Rebuilding gems..."
                  rm -rf "$site_root/.gem"
                  return 1
                fi

                # Restore environment
                export GEM_HOME="$old_gem_home"
                export GEM_PATH="$old_gem_path"
                export PATH="$old_path"
                export BUNDLE_GEMFILE="$old_bundle_gemfile"
                export BUNDLE_PATH="$old_bundle_path"
                
                echo "Ruby environment check passed."
                return 0
              }

              # Function to ensure gems are installed
              ensure_gems_installed() {
                cd "$site_root"
                
                # Save current environment
                local old_gem_home="$GEM_HOME"
                local old_gem_path="$GEM_PATH"
                local old_path="$PATH"
                local old_bundle_gemfile="$BUNDLE_GEMFILE"
                local old_bundle_path="$BUNDLE_PATH"
                
                # Set environment for bundle
                export GEM_HOME="$PWD/.gem"
                export GEM_PATH="$GEM_HOME"
                export PATH="$GEM_HOME/bin:$PATH"
                export BUNDLE_GEMFILE="$PWD/Gemfile"
                export BUNDLE_PATH="$GEM_HOME"
                
                local bundle_output
                bundle_output=$(bundle check 2>&1)
                local bundle_status=$?
                
                if [ $bundle_status -ne 0 ]; then
                  echo "Missing gems detected. Installing..."
                  echo "Error output: $bundle_output"
                  
                  echo "Installing bundler..."
                  gem install bundler --no-document
                  
                  echo "Setting bundler config..."
                  bundle config set --local path "$GEM_HOME"
                  bundle config build.nokogiri --use-system-libraries
                  bundle config build.ffi --enable-system-libffi
                  bundle config build.eventmachine --with-cflags="-I${pkgs.openssl.dev}/include"
                  bundle config set force_ruby_platform true
                  
                  echo "Installing gems (this may take a while)..."
                  BUNDLE_FORCE_RUBY_PLATFORM=1 RUBYOPT="-W0" bundle install
                else
                  echo "All gems are already installed."
                fi
                
                # Restore environment
                export GEM_HOME="$old_gem_home"
                export GEM_PATH="$old_gem_path"
                export PATH="$old_path"
                export BUNDLE_GEMFILE="$old_bundle_gemfile"
                export BUNDLE_PATH="$old_bundle_path"
                
                cd "$current_dir"
              }

              # Check for Ruby version mismatch and rebuild if needed
              if ! check_ruby_version; then
                echo "Rebuilding Ruby environment..."
                cd "$site_root"
                
                # Save current environment
                local old_gem_home="$GEM_HOME"
                local old_gem_path="$GEM_PATH"
                local old_path="$PATH"
                local old_bundle_gemfile="$BUNDLE_GEMFILE"
                local old_bundle_path="$BUNDLE_PATH"
                
                # Set environment for rebuild
                export GEM_HOME="$PWD/.gem"
                export GEM_PATH="$GEM_HOME"
                export PATH="$GEM_HOME/bin:$PATH"
                export BUNDLE_GEMFILE="$PWD/Gemfile"
                export BUNDLE_PATH="$GEM_HOME"
                
                echo "Installing bundler..."
                gem install bundler --no-document
                
                echo "Setting bundler config..."
                bundle config set --local path "$GEM_HOME"
                bundle config build.nokogiri --use-system-libraries
                bundle config build.ffi --enable-system-libffi
                bundle config build.eventmachine --with-cflags="-I${pkgs.openssl.dev}/include"
                bundle config set force_ruby_platform true
                
                echo "Installing gems (this may take a while)..."
                BUNDLE_FORCE_RUBY_PLATFORM=1 RUBYOPT="-W0" bundle install
                
                # Restore environment
                export GEM_HOME="$old_gem_home"
                export GEM_PATH="$old_gem_path"
                export PATH="$old_path"
                export BUNDLE_GEMFILE="$old_bundle_gemfile"
                export BUNDLE_PATH="$old_bundle_path"
                
                cd "$current_dir"
              else
                # Only ensure gems are installed if version check passed
                ensure_gems_installed
              fi

              # Kill any running Jekyll processes in this directory only
              echo "Stopping any existing Jekyll servers in $(basename "$site_root")..."
              pkill -f "jekyll serve.*$site_root" || true
              
              # Give processes time to terminate
              sleep 1
              
              # Change to the site root
              cd "$site_root"
              echo "Serving from $(pwd) on port $port..."
              RUBYOPT="-W0" bundle exec jekyll serve --verbose --incremental --port $port
              
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
            
            # Automatically start Jekyll server
            echo ""
            echo "🚀 Starting Jekyll server automatically..."
            echo "Press Ctrl+C to stop the server and exit the environment."
            echo ""
            jes
          '';
        };
      });
}
