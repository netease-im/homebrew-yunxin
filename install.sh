#!/usr/bin/env bash
#
# One-line installer for Tokbox via Homebrew Cask.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/netease-im/homebrew-yunxin/main/install.sh | bash
#
set -euo pipefail

TAP="netease-im/yunxin"
CASK="tokbox"
REPO="https://github.com/netease-im/homebrew-yunxin"

# Colors (only when output is a TTY).
if [ -t 1 ]; then
  BOLD="\033[1m"
  GREEN="\033[32m"
  RED="\033[31m"
  RESET="\033[0m"
else
  BOLD=""; GREEN=""; RED=""; RESET=""
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

# --- Tap + install --------------------------------------------------------

info "Adding tap ${TAP}..."
brew tap "${TAP}" "${REPO}"

info "Installing ${CASK}..."
brew install --cask "${CASK}"

ok "${CASK} installed! Find it in /Applications or Spotlight."
