# macOS Flashing Guide

Follow this guide to prepare the Jetson Orin Nano Developer Kit SD card image from a macOS host.

## 1. Prerequisites

- macOS 12 (Monterey) or newer
- [balenaEtcher](https://etcher.io) or Apple Disk Utility
- Terminal access for checksum verification

## 2. Download and Verify the Image

1. Download the `.zip` image from the [JetPack download page](https://developer.nvidia.com/embedded/jetpack-sdk-62).
2. Open **Terminal**, navigate to the download directory, and run:

   ```bash
   shasum -a 256 Jetson_Orin_Nano_Developer_Kit_SD_Card_Image.zip
   ```

3. Confirm the hash matches NVIDIA's published checksum.
4. To automate the download and verification on macOS, run the Bash helper script included in this repository:

   ```bash
   chmod +x ./scripts/download_jetpack.sh
   ./scripts/download_jetpack.sh --version 6.2 --output "$HOME/Downloads"
   ```

   The script downloads the image, performs a SHA-256 check, and saves a `.log` file alongside the image.

## 3. Flash the Image with Etcher (Recommended)

1. Launch **balenaEtcher**.
2. Click **Flash from file** and select the downloaded `.zip` file.
3. Insert the microSD card. If macOS reports that the disk is unreadable, click **Ignore**.
4. Click **Select target** and choose the microSD card.
5. Click **Flash!** and authenticate with your username/password or Touch ID.
6. Wait for the flashing and validation processes to complete, then eject the card using Finder.

## 4. Flash with Disk Utility (Alternative)

1. Double-click the `.zip` file to extract the `.img` image.
2. Open **Disk Utility** and select the microSD card device (not the partition).
3. Click **Erase**, choose `MS-DOS (FAT)` and `Master Boot Record`, and erase the card.
4. Choose **Restore**, select the `.img` file, and confirm. Disk Utility writes the image directly to the card.

## 5. Command-Line Workflow (Advanced)

1. Use `diskutil list` to identify the disk (for example, `/dev/disk4`).
2. Unmount the disk: `diskutil unmountDisk /dev/disk4`.
3. Flash the image with `dd`:

   ```bash
   sudo dd if=Jetson_Orin_Nano_Developer_Kit_SD_Card_Image.img of=/dev/rdisk4 bs=1m status=progress
   sudo sync
   ```

4. Eject the card: `diskutil eject /dev/disk4`.

## 6. Troubleshooting Tips

- **Etcher cannot access the disk**: Quit Etcher, remove and reinsert the card, then reopen Etcher.
- **Disk Utility restore fails**: Ensure the `.img` file is fully extracted and the microSD card is not write-protected.
- **Checksum mismatch**: Delete the download and run the helper script to re-fetch the image with logging.

Visit the [troubleshooting appendix](troubleshooting.md) for additional diagnostics.
