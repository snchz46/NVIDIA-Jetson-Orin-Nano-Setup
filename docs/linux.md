# Linux Flashing Guide

Use this guide to download, verify, and flash the Jetson Orin Nano Developer Kit SD card image from a Linux host.

## 1. Prerequisites

- Ubuntu 20.04 or newer (other distributions work with equivalent tools)
- `curl` or `wget`, `unzip`, and `dd`
- Optional: [balenaEtcher](https://etcher.io) AppImage for a graphical workflow

## 2. Download and Verify the Image

1. Download the `.zip` image from the [JetPack download page](https://developer.nvidia.com/embedded/jetpack-sdk-62) using a browser or command line:

   ```bash
   wget https://developer.nvidia.com/downloads/embedded/jetson/Jetson_Orin_Nano_Developer_Kit_SD_Card_Image.zip
   ```

2. Compute the checksum:

   ```bash
   sha256sum Jetson_Orin_Nano_Developer_Kit_SD_Card_Image.zip
   ```

3. Match the hash against NVIDIA's published value.
4. To automate the workflow, run the helper script:

   ```bash
   chmod +x ./scripts/download_jetpack.sh
   ./scripts/download_jetpack.sh --version 6.2 --output "$HOME/Downloads"
   ```

   The script downloads the image, verifies the checksum, and records actions in a timestamped log.

## 3. Flash with balenaEtcher (GUI)

1. Download the Etcher AppImage and make it executable: `chmod +x balenaEtcher-*.AppImage`.
2. Launch Etcher and click **Flash from file**.
3. Select the `.zip` file, choose your microSD card, and click **Flash!**.
4. Wait for the process to finish, then eject the card safely.

## 4. Flash from the Command Line (Recommended for Servers)

1. Identify the microSD device:

   ```bash
   lsblk
   ```

2. Unzip the image:

   ```bash
   unzip Jetson_Orin_Nano_Developer_Kit_SD_Card_Image.zip
   ```

3. Flash the image with `dd` (replace `sdX` with your device, such as `sdb`):

   ```bash
   sudo dd if=Jetson_Orin_Nano_Developer_Kit_SD_Card_Image.img of=/dev/sdX bs=1M status=progress conv=fsync
   sudo sync
   ```

4. Remove the card: `sudo eject /dev/sdX` or unplug it once the command completes.

## 5. Troubleshooting Tips

- **Permission denied**: Ensure you run Etcher or `dd` with `sudo`.
- **Slow write speeds**: Use a USB 3.0 card reader and confirm the card is UHS-I or better.
- **Checksum mismatch**: Delete the file and rerun `download_jetpack.sh` to pull a clean copy.

For advanced recovery steps, see the [troubleshooting appendix](troubleshooting.md).
