# Windows Flashing Guide

This guide explains how to download, verify, and flash the Jetson Orin Nano Developer Kit SD card image from a Windows host.

## 1. Prerequisites

- Windows 10 or 11 host with administrator access
- SD Association's [SD Memory Card Formatter](https://www.sdcard.org/downloads/formatter/)
- [balenaEtcher](https://etcher.io) for flashing
- PowerShell 5.1 or newer (included with modern Windows versions)

## 2. Download and Verify the Image

1. Download the `.zip` image from the [JetPack download page](https://developer.nvidia.com/embedded/jetpack-sdk-62).
2. Open PowerShell in the directory containing the download and compute the checksum:

   ```powershell
   Get-FileHash -Path .\Jetson_Orin_Nano_Developer_Kit_SD_Card_Image.zip -Algorithm SHA256
   ```

3. Compare the resulting hash with NVIDIA's published checksum.
4. To automate the process, run the helper script from this repository:

   ```powershell
   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
   ./scripts/download-jetpack.ps1 -Version "6.2" -Destination "$env:USERPROFILE\Downloads"
   ```

   The script downloads the image, verifies the hash, and saves a log file beside the download for future reference.

## 3. Format the microSD Card

1. Insert the microSD card into your Windows PC.
2. Launch **SD Card Formatter**.
3. Select the correct drive letter. Double-check the capacity to avoid formatting the wrong disk.
4. Choose **Quick format**, leave the volume label empty, and click **Format**.
5. Confirm the warning prompt and wait for completion.

## 4. Flash the Image with Etcher

1. Open **balenaEtcher**.
2. Click **Flash from file** (or **Select image** in older versions) and choose the `.zip` file. Etcher can flash directly from the compressed archive.
3. Click **Select target** and choose your microSD card.
4. Click **Flash!**. Approve the User Account Control prompt when requested.
5. Wait for Etcher to finish writing and validating the card (typically 10–15 minutes on USB 3.0).
6. When Etcher reports success, close any Windows dialogs that state the card needs to be formatted—this is expected. Use **Safely Remove Hardware** to eject the card.

## 5. Command-Line Alternative (Advanced)

If you prefer the Windows Subsystem for Linux (WSL) or have `dd` available through Cygwin, you can flash from the terminal. Refer to [`linux.md`](linux.md) for the `dd` command syntax and ensure the device path matches your environment.

## 6. Troubleshooting Tips

- **Flash fails immediately**: Re-run Etcher as administrator and ensure no antivirus software blocks raw disk access.
- **Verification fails**: Use PowerShell to recompute the checksum. If it differs, delete the file and re-download.
- **Windows prompts to format after flashing**: Ignore the prompt—Windows cannot read the Linux partitions on the SD card.

For additional recovery steps, see the [troubleshooting appendix](troubleshooting.md).
