#!/usr/bin/env bash

# Strict mode
set -euo pipefail

# --- Configuration ---
REPO_USER="miklevin"
REPO_NAME="pipulate"
# Stable URL for the main branch ZIP
ZIP_URL="https://github.com/${REPO_USER}/${REPO_NAME}/archive/refs/heads/main.zip"
# Target directory name
TARGET_DIR="${REPO_NAME}"
# Temporary directory for ZIP extraction
TMP_EXTRACT_DIR="${REPO_NAME}-main"
# --- REMOVED EMBEDDED KEY VARIABLE ---
# URL for the ROT13 deploy key (fetched instead of embedded)
KEY_URL="https://pipulate.com/key.rot"

# --- Helper Functions ---
check_command() {
  if ! command -v "$1" &> /dev/null; then
    echo "Error: Required command '$1' not found. Please install it."
    exit 1
  fi
}

# --- Dependency Checks ---
echo "--- Checking prerequisites ---"
check_command "curl"
check_command "git"
check_command "unzip"
check_command "nix" # Should be present after Command 1 + terminal restart
echo "Looks good."
echo

# --- Target Directory Handling ---
echo "--- Setting up target directory: ${TARGET_DIR} ---"
if [ -d "${TARGET_DIR}" ]; then
  echo "Directory '${TARGET_DIR}' already exists."
  if [ -d "${TARGET_DIR}/.git" ]; then
    echo "It appears to be a Git repository. Assuming previous install."
    echo "Attempting to enter directory and run nix develop for updates..."
    cd "${TARGET_DIR}"
    echo "Running 'nix develop'..."
    # Use exec to replace the script process with nix develop
    exec nix develop
    # The script ends here if the directory was a valid git repo
  else
    echo "Error: Directory '${TARGET_DIR}' exists but is not a Git repository."
    echo "Please remove or rename it, then run this script again."
    exit 1
  fi
else
  echo "Creating directory '${TARGET_DIR}'."
  mkdir "${TARGET_DIR}"
fi

# --- Download and Extract ---
echo "--- Downloading Pipulate source code ---"
# Download to a temporary file
TMP_ZIP_FILE=$(mktemp)
# Ensure temp file is removed on exit
trap 'rm -f "$TMP_ZIP_FILE"' EXIT
curl -L --fail -o "${TMP_ZIP_FILE}" "${ZIP_URL}"
echo "Download complete."
echo

echo "--- Extracting source code ---"
# Extract into the newly created TARGET_DIR
unzip -q "${TMP_ZIP_FILE}" -d "." # Extract to current dir (where TARGET_DIR is)
# Check if extraction created the expected directory
if [ ! -d "${TMP_EXTRACT_DIR}" ]; then
  echo "Error: Extraction did not produce the expected directory '${TMP_EXTRACT_DIR}'."
  exit 1
fi
# Move extracted contents into TARGET_DIR, overwriting if needed (though TARGET_DIR should be empty)
# Using shopt for dotfiles if available, otherwise manual mv
(shopt -s dotglob && mv "${TMP_EXTRACT_DIR}"/* "${TARGET_DIR}"/) || mv "${TMP_EXTRACT_DIR}"/* "${TMP_EXTRACT_DIR}"/.??* "${TARGET_DIR}"/ 2>/dev/null
rm -rf "${TMP_EXTRACT_DIR}" # Remove the now-empty extracted dir shell
rm -f "$TMP_ZIP_FILE" # Remove the downloaded zip
trap - EXIT # Clear the trap
echo "Extraction complete. Source code moved to '${TARGET_DIR}'."
echo

# --- Navigate Into Project ---
cd "${TARGET_DIR}"
echo "Changed directory to '$(pwd)'."
echo

# --- Deploy Key Setup ("Magic Cookie") ---
echo "--- Setting up deployment key ---"
mkdir -p .ssh
echo "Fetching deployment key from ${KEY_URL}..."
# Use curl to fetch the key from the URL and save it to .ssh/rot
if curl -L -sS --fail -o .ssh/rot "${KEY_URL}"; then
  echo "Deployment key downloaded successfully."
else
  echo "Error: Failed to download deployment key from ${KEY_URL}."
  # Optional: remove potentially incomplete key file
  rm -f .ssh/rot
  exit 1
fi

# Verify that the downloaded file is not empty
if [ ! -s .ssh/rot ]; then
    echo "Error: Downloaded deployment key file (.ssh/rot) is empty."
    rm -f .ssh/rot # Clean up empty file
    exit 1
fi

chmod 600 .ssh/rot # Important: Set permissions for the raw key file
echo "Deployment key file saved to .ssh/rot"
echo

# --- Trigger Initial Nix Build & Git Conversion ---
echo "--- Running 'nix develop' for the first time ---"
echo "This will build the environment, convert to Git repo, pull latest, and start services."
# Use exec to replace this script's process with nix develop
# Any arguments passed to install.sh could potentially be passed to nix develop here if needed.
exec nix develop
# The script effectively ends here, handing over control to nix develop and the flake's shellHook.

echo "--- Setup should be complete ---" # This line likely won't be reached due to exec
