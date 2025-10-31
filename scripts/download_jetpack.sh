#!/usr/bin/env bash
set -euo pipefail

VERSION=""
OUTPUT_DIR=""
DOWNLOAD_URL=""
EXPECTED_SHA256=""

usage() {
  cat <<USAGE
Usage: $0 --version <jetpack_version> --output <directory> --url <download_url> [--sha256 <expected_hash>]

The script downloads the Jetson Orin Nano Developer Kit SD card image, computes its SHA-256 checksum,
and optionally verifies it against the expected value. Because NVIDIA's downloads require authentication,
you must supply a pre-authenticated URL from the JetPack portal.
USAGE
}

log() {
  echo "[$(date -u +"%Y-%m-%dT%H:%M:%SZ")] $*" | tee -a "$LOG_FILE"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --version)
      VERSION="$2"
      shift 2
      ;;
    --output)
      OUTPUT_DIR="$2"
      shift 2
      ;;
    --url)
      DOWNLOAD_URL="$2"
      shift 2
      ;;
    --sha256)
      EXPECTED_SHA256="${2,,}"
      shift 2
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$VERSION" || -z "$OUTPUT_DIR" || -z "$DOWNLOAD_URL" ]]; then
  echo "Error: --version, --output, and --url are required." >&2
  usage
  exit 1
fi

mkdir -p "$OUTPUT_DIR"
LOG_FILE="$OUTPUT_DIR/jetpack-${VERSION}-download.log"

log "Starting JetPack ${VERSION} download"
FILE_NAME="Jetson_Orin_Nano_Developer_Kit_SD_Card_Image_${VERSION}.zip"
TARGET_PATH="$OUTPUT_DIR/$FILE_NAME"

log "Fetching image from $DOWNLOAD_URL"
if command -v curl >/dev/null 2>&1; then
  curl --fail --location --output "$TARGET_PATH" "$DOWNLOAD_URL"
elif command -v wget >/dev/null 2>&1; then
  wget --output-document="$TARGET_PATH" "$DOWNLOAD_URL"
else
  log "Neither curl nor wget is available. Install one of them and retry."
  exit 1
fi

log "Download complete: $TARGET_PATH"
COMPUTED_SHA256=$(sha256sum "$TARGET_PATH" | awk '{print tolower($1)}')
log "Computed SHA-256: $COMPUTED_SHA256"

if [[ -n "$EXPECTED_SHA256" ]]; then
  if [[ "$COMPUTED_SHA256" == "$EXPECTED_SHA256" ]]; then
    log "Checksum verification succeeded."
  else
    log "Checksum verification FAILED. Expected $EXPECTED_SHA256"
    exit 2
  fi
else
  log "No expected hash provided; verification skipped."
fi

log "All tasks completed."
