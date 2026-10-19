#!/usr/bin/env bash
# Public installer entry point. No product source or credentials are embedded.
set -Eeuo pipefail

usage() {
  printf '%s\n' \
    'AI Server Manager installer' \
    'Usage: bash install.sh [auto|nvidia|amd|cpu] [--download-only]' \
    '' \
    'auto             Detect hardware using the official installer (default).' \
    'nvidia|amd|cpu   Download the installer for the selected hardware.' \
    '--download-only Save a new installer file for review; do not run it.' \
    '--help           Show this help.' \
    '' \
    'Downloads only from https://ai-server-manager.ru over verified HTTPS.' \
    'The installer may install Docker and create panel/updater services.' \
    'See docs/en/installation.md before running it on a production host.'
}

install_gpu=auto
install_variant_set=0
install_download_only=0
for install_arg in "$@"; do
  case "$install_arg" in
    auto|nvidia|amd|cpu)
      if (( install_variant_set )); then
        printf 'Choose only one hardware variant.\n' >&2
        exit 2
      fi
      install_gpu=$install_arg
      install_variant_set=1
      ;;
    --download-only) install_download_only=1 ;;
    -h|--help) usage; exit 0 ;;
    *) printf 'Unknown argument: %s\n' "$install_arg" >&2; usage >&2; exit 2 ;;
  esac
done

for install_tool in curl bash mktemp head wc cp chmod rm rmdir; do
  command -v "$install_tool" >/dev/null 2>&1 || {
    printf 'Required command is missing: %s\n' "$install_tool" >&2
    exit 1
  }
done

install_url=https://ai-server-manager.ru/api/install
if [[ "$install_gpu" != auto ]]; then
  install_url+=/$install_gpu
fi

asm_install_dir=$(mktemp -d "${TMPDIR:-/tmp}/asm-public-install.XXXXXXXX")
asm_install_script=$asm_install_dir/install.sh
cleanup() {
  rm -f -- "$asm_install_script"
  rmdir -- "$asm_install_dir" 2>/dev/null || true
}
trap cleanup EXIT

printf 'Downloading the official %s installer from %s\n' "$install_gpu" "$install_url"
curl --fail --silent --show-error --location --max-redirs 3 \
  --proto '=https' --proto-redir '=https' --tlsv1.2 \
  --connect-timeout 15 --max-time 120 \
  "$install_url" --output "$asm_install_script"

if [[ ! -s "$asm_install_script" ]] || (( $(wc -c < "$asm_install_script") > 2097152 )); then
  printf 'The downloaded installer is empty or unexpectedly large. Nothing was run.\n' >&2
  exit 1
fi
if [[ "$(head -n 1 "$asm_install_script")" != '#!/bin/bash' && "$(head -n 1 "$asm_install_script")" != '#!/usr/bin/env bash' ]]; then
  printf 'The server did not return the expected Bash installer. Nothing was run.\n' >&2
  exit 1
fi
bash -n "$asm_install_script"

if (( install_download_only )); then
  install_saved=$(mktemp "./ai-server-manager-${install_gpu}.XXXXXXXX")
  cp -- "$asm_install_script" "$install_saved"
  chmod 700 "$install_saved"
  printf 'Saved for review: %s\nNo installation was performed.\n' "$install_saved"
  exit 0
fi

printf '%s\n' 'Starting the official installer. Review its prompts and keep credentials private.'
bash "$asm_install_script"
