#!/usr/bin/env bash
#
# Bootstrap script for the netease-im/yunxin Homebrew tap.
#
# Installs Homebrew (if missing), adds the tap, and optionally installs
# one or more casks from it.
#
# Usage:
#   # Just add the tap, then list available casks:
#   curl -fsSL https://raw.githubusercontent.com/netease-im/homebrew-yunxin/main/install.sh | bash
#
#   # Add the tap and install specific cask(s):
#   curl -fsSL https://raw.githubusercontent.com/netease-im/homebrew-yunxin/main/install.sh | bash -s -- tokbox
#   curl -fsSL ... | bash -s -- tokbox another-app
#
set -euo pipefail

TAP="netease-im/yunxin"
REPO="https://github.com/netease-im/homebrew-yunxin"

# Colors (only when output is a TTY).
if [ -t 1 ]; then
  BOLD="\033[1m"
  GREEN="\033[32m"
  RED="\033[31m"
  CYAN="\033[36m"
  RESET="\033[0m"
else
  BOLD=""; GREEN=""; RED=""; CYAN=""; RESET=""
fi

info()  { printf "${BOLD}==>${RESET} %s\n" "$*"; }
ok()    { printf "${GREEN}==>${RESET} %s\n" "$*"; }
die()   { printf "${RED}Error:${RESET} %s\n" "$*" >&2; exit 1; }

# --- Homebrew bootstrap ---------------------------------------------------

if ! command -v brew >/dev/null 2>&1; then
  info "Homebrew not found, installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    || die "Failed to install Homebrew."

  # Source brew into the current shell so `brew` is on PATH right away.
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  command -v brew >/dev/null 2>&1 \
    || die "Homebrew installed but 'brew' not on PATH. Open a new terminal and re-run."
fi

# --- Add tap --------------------------------------------------------------

info "Adding tap ${TAP}..."
brew tap "${TAP}" "${REPO}"

# --- Install requested casks, or list what's available --------------------

if [ "$#" -gt 0 ]; then
  for cask in "$@"; do
    info "Installing ${cask}..."
    brew install --cask "${cask}"
    ok "${cask} installed."
  done
else
  # No args: list what this tap provides so the user can choose.
  printf "\nAvailable casks in ${CYAN}${TAP}${RESET}:\n\n"
  brew search --casks "${TAP}/" 2>/dev/null | sed 's/^/  /'
  printf "\nInstall with: ${BOLD}brew install --cask <name>${RESET}\n"
fi
