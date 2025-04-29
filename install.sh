#!/usr/bin/env bash
# Pipulate Installer v1.0.8 - Cache-busting version

# Strict mode
set -euo pipefail

# --- Configuration ---
REPO_USER="miklevin"
REPO_NAME="pipulate"
# Stable URL for the main branch ZIP
ZIP_URL="https://github.com/${REPO_USER}/${REPO_NAME}/archive/refs/heads/main.zip"
# Target directory name - use absolute path to avoid any confusion
TARGET_DIR="${HOME}/${REPO_NAME}"
# Temporary directory for ZIP extraction
TMP_EXTRACT_DIR="${REPO_NAME}-main"
# URL for the ROT13 deploy key
KEY_URL="https://pipulate.com/key.rot"

# --- Helper Functions ---
check_command() {
  if ! command -v "$1" &> /dev/null; then
    echo "Error: Required command '$1' not found. Please install it."
    exit 1
  fi
}

print_separator() {
  echo "--------------------------------------------------------------"
}

# --- Display Banner ---
echo
print_separator
echo "   🚀 Welcome to Pipulate Installer 🚀   "
echo "   Free and Open Source SEO Software     "
print_separator
echo

# --- Dependency Checks ---
echo "🔍 Checking prerequisites..."
check_command "curl"
check_command "git"
check_command "unzip"
check_command "nix" # Should be present after Command 1 + terminal restart
echo "✅ All required tools found."
echo

# --- Target Directory Handling ---
echo "📁 Setting up target directory: ${TARGET_DIR}"
if [ -d "${TARGET_DIR}" ]; then
  echo "Directory '${TARGET_DIR}' already exists."
  if [ -d "${TARGET_DIR}/.git" ]; then
    echo "ℹ️ It appears to be a Git repository. Assuming previous install."
    echo "ℹ️ Entering directory and running nix develop for updates..."
    cd "${TARGET_DIR}"
    echo "🚀 Starting Pipulate environment..."
    print_separator
    echo "  To use Pipulate in the future, simply run:  "
    echo "  cd ${TARGET_DIR} && nix develop  "
    print_separator
    echo
    # Run nix develop directly (not with exec so our info message is visible)
    nix develop
    exit 0
  else
    echo "❌ Error: Directory '${TARGET_DIR}' exists but is not a Git repository."
    echo "   Please remove or rename it, then run this script again."
    echo "   For example: rm -rf ${TARGET_DIR}"
    exit 1
  fi
else
  echo "📁 Creating directory '${TARGET_DIR}'"
  mkdir -p "${TARGET_DIR}"
fi

# --- Download and Extract ---
echo "📥 Downloading Pipulate source code..."
# Download to a temporary file
TMP_ZIP_FILE=$(mktemp)
# Ensure temp file is removed on exit
trap 'rm -f "$TMP_ZIP_FILE"' EXIT
curl -L --fail -o "${TMP_ZIP_FILE}" "${ZIP_URL}"
echo "✅ Download complete."
echo

echo "📦 Extracting source code..."
# Create a temporary directory for extraction
TMP_EXTRACT_PATH=$(mktemp -d)
trap 'rm -rf "$TMP_EXTRACT_PATH"; rm -f "$TMP_ZIP_FILE"' EXIT

# Extract into the temporary directory
unzip -q "${TMP_ZIP_FILE}" -d "${TMP_EXTRACT_PATH}"

# Check if extraction created the expected directory
FULL_EXTRACT_DIR="${TMP_EXTRACT_PATH}/${TMP_EXTRACT_DIR}"
if [ ! -d "${FULL_EXTRACT_DIR}" ]; then
  echo "❌ Error: Extraction did not produce the expected directory '${TMP_EXTRACT_DIR}'."
  exit 1
fi

# Move extracted contents into TARGET_DIR
# Using cp first to ensure all files are copied correctly
cp -R "${FULL_EXTRACT_DIR}/." "${TARGET_DIR}/"
rm -f "$TMP_ZIP_FILE"
echo "✅ Extraction complete. Source code installed to '${TARGET_DIR}'."
echo

# --- Navigate Into Project ---
cd "${TARGET_DIR}"
echo "📍 Now in directory: $(pwd)"
echo

# --- Deploy Key Setup ("Magic Cookie") ---
echo "🔑 Setting up deployment key..."
mkdir -p .ssh
echo "Fetching deployment key from ${KEY_URL}..."
# Use curl to fetch the key from the URL and save it to .ssh/rot
if curl -L -sS --fail -o .ssh/rot "${KEY_URL}"; then
  echo "✅ Deployment key downloaded successfully."
else
  echo "❌ Error: Failed to download deployment key from ${KEY_URL}."
  # Optional: remove potentially incomplete key file
  rm -f .ssh/rot
  exit 1
fi

# Verify that the downloaded file is not empty
if [ ! -s .ssh/rot ]; then
    echo "❌ Error: Downloaded deployment key file (.ssh/rot) is empty."
    rm -f .ssh/rot # Clean up empty file
    exit 1
fi

chmod 600 .ssh/rot # Important: Set permissions for the raw key file
echo "🔒 Deployment key file saved and secured."
echo

# --- Trigger Initial Nix Build & Git Conversion ---
echo "🚀 Starting Pipulate environment..."
print_separator
echo "  All set! Pipulate is installed at: ${TARGET_DIR}  "
echo "  To use Pipulate in the future, simply run:  "
echo "  cd ${TARGET_DIR} && nix develop  "
print_separator
echo

# When piping through sh, interactive shells won't work
# Ensure dependencies are installed before starting the server
cd "${TARGET_DIR}"

echo "✨ Setting up Pipulate environment and starting server..."
echo "📋 JupyterLab and Pipulate tabs will open automatically." 
echo "   (Pipulate tab will open after a 7-second delay)"
echo "   You can stop this process with Ctrl+C and restart later with:"
echo "   cd ${TARGET_DIR} && nix develop --command python server.py"
echo

# First run a regular nix develop to ensure all dependencies are built
# Then start the server directly with python server.py
exec bash -c "cd ${TARGET_DIR} && nix develop --command python server.py"
