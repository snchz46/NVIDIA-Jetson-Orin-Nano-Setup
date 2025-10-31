# NVIDIA Jetson Orin Nano Setup
> A guide by Samuel Sanchez, Master student at Hochschule Esslingen

This document walks through the process of preparing a bootable microSD card and powering on the NVIDIA Jetson Orin Nano Developer Kit. The guide has been reorganized so you can quickly locate the steps that correspond to your operating system and get your developer kit running with confidence.

## Table of Contents

1. [Before You Start](#before-you-start)
2. [Download the Jetson Image](#download-the-jetson-image)
3. [Flash the Image](#flash-the-image)
    - [Windows](#windows)
    - [macOS](#macos)
    - [Linux](#linux)
4. [First Boot Checklist](#first-boot-checklist)
5. [References](#references)

## Before You Start

Gather the following items and complete these prerequisites before you begin flashing the microSD card:

- Jetson Orin Nano Developer Kit (including power supply and carrier board)
- microSD card (64 GB or larger, UHS-1 or better recommended)
- microSD card reader (built-in or USB adapter)
- Host computer with an internet connection (Windows, macOS, or Linux)
- Optional: USB keyboard, mouse, and HDMI display for first boot

> **Tip:** The first boot will guide you through regional settings, network setup, and account creation. Having peripherals ready will speed up the process.

## Download the Jetson Image

1. Visit the [JetPack 6.2 download page](https://developer.nvidia.com/embedded/jetpack-sdk-62) on your host computer.
2. Download the Jetson Orin Nano Developer Kit SD card image (a `.zip` file). Take note of the download location.
3. Verify the download if you need absolute integrity by comparing the provided SHA checksum with your local file.

Once the download finishes, you're ready to flash the image to the microSD card using the steps for your operating system.

<img width="1325" height="345" alt="Screenshot of the JetPack download page" src="https://github.com/user-attachments/assets/bbdbfa72-f09b-48a2-a7c8-5dfc39ec6a58" />

## Flash the Image

### Windows

1. **Format the microSD card** using the SD Association's SD Memory Card Formatter:
   - Download, install, and launch the formatter.
   - Select your microSD card drive.
   - Choose **Quick format** and leave the volume label blank.
   - Click **Format**, then confirm the warning dialog.

   <img width="392" height="429" alt="SD Card Formatter screenshot" src="https://github.com/user-attachments/assets/c07d15ce-8b4d-485f-a805-85e1a11380ec" />

2. **Flash the image with Etcher**:
   - Download, install, and open Etcher.
   - Click **Select image** and choose the zipped Jetson image.
   - Insert your microSD card (cancel any Windows pop-ups that appear).
   - Click **Select drive** and ensure the correct device is selected.
   - Click **Flash!** and wait for Etcher to write and validate the card (about 15 minutes over USB 3.0).
   - When Etcher reports success, close any Windows prompts about unreadable drives and safely remove the microSD card.

   <img width="512" height="325" alt="Etcher running on Windows" src="https://github.com/user-attachments/assets/c759467b-107a-4ad5-a099-b0165b0ce6ab" />

### macOS

1. **Launch Etcher** (other tools like Apple Disk Utility work, but Etcher provides the simplest workflow).
2. Click **Select image** and choose the Jetson image `.zip` file.
3. Insert your microSD card. If macOS displays a message saying the disk is unreadable, click **Ignore**.
4. Confirm the correct target under **Select drive** if multiple disks are attached.
5. Click **Flash!** and authenticate with your username and password when prompted.
6. Wait ~10 minutes for Etcher to complete the write and validation process, then eject the microSD card when Etcher finishes.

   <img width="512" height="243" alt="Etcher running on macOS" src="https://github.com/user-attachments/assets/84304c21-43f5-4b41-8012-5085dbcd8f76" />

   <img width="440" height="156" alt="macOS unreadable disk warning" src="https://github.com/user-attachments/assets/e9a44c1f-a881-4af3-867c-2494fcbaf401" />

   <img width="443" height="232" alt="macOS security prompt" src="https://github.com/user-attachments/assets/cef85adb-1505-4c00-96ad-320a23db2b5c" />

### Linux

Balena Etcher also supports Linux, but you can flash the image directly from the terminal if you prefer:

1. Identify your microSD card device with `lsblk` (for example, `/dev/sdX`).
2. Unzip the Jetson image: `unzip jetson-orin-nano-sd-card-image.zip`.
3. Use `dd` to write the image, replacing `sdX` with your device name:

   ```bash
   sudo dd if=jetson-orin-nano-sd-card-image.img of=/dev/sdX bs=1M status=progress conv=fsync
   ```

4. Run `sync` to flush buffers, then safely remove the microSD card.

> **Warning:** Double-check the device path before running `dd`. Writing to the wrong device can erase data on your computer.

## First Boot Checklist

1. Insert the prepared microSD card into the Jetson Orin Nano.
2. Connect the power supply, display, keyboard, and mouse.
3. Power on the developer kit and follow the on-screen setup wizard.
4. When prompted, connect to a network so you can download updates and SDK components.
5. Optionally install additional JetPack components via the on-device **NVIDIA SDK Manager** or from a host PC.

After finishing the wizard, you should be greeted with the Ubuntu desktop running on your Jetson Orin Nano.

## References

- [Jetson Orin Nano Developer Kit Getting Started Guide](https://developer.nvidia.com/embedded/learn/get-started-jetson-orin-nano-devkit#write)
- [NVIDIA JetPack 6.2](https://developer.nvidia.com/embedded/jetpack-sdk-62)
