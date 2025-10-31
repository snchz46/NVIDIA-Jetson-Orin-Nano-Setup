# NVIDIA Jetson Orin Nano Setup
> A guide by Samuel Sanchez, Master student at Hochschule Esslingen

This repository now bundles a richer set of resources for preparing and maintaining the NVIDIA Jetson Orin Nano Developer Kit. In addition to the original flashing walkthrough, you will find hardware assembly tips, checksum verification commands, automation scripts, and deeper troubleshooting advice so that newcomers can progress with confidence.

## Table of Contents

1. [Quick Start](#quick-start)
2. [Repository Structure](#repository-structure)
3. [Hardware Setup Overview](#hardware-setup-overview)
4. [Download and Verify the Jetson Image](#download-and-verify-the-jetson-image)
5. [Flash the Image](#flash-the-image)
6. [First Boot and Post-Install Tasks](#first-boot-and-post-install-tasks)
7. [Next Steps and Learning Resources](#next-steps-and-learning-resources)
8. [Troubleshooting](#troubleshooting)
9. [Contributing](#contributing)
10. [References](#references)

## Quick Start

1. Review the [hardware setup checklist](#hardware-setup-overview) and gather the required peripherals.
2. Download the latest Jetson Orin Nano Developer Kit SD card image and verify the checksum using the commands below or the helper scripts in [`scripts/`](scripts/).
3. Follow the OS-specific flashing guide in [`docs/windows.md`](docs/windows.md), [`docs/macos.md`](docs/macos.md), or [`docs/linux.md`](docs/linux.md).
4. Complete the [first boot and post-install tasks](#first-boot-and-post-install-tasks) to update the system, enable remote access, and install optional JetPack components.

## Repository Structure

```
.
├── README.md                # High-level overview and quick links
├── docs/
│   ├── index.md             # Detailed documentation index
│   ├── hardware-assembly.md # Physical assembly and visual guidance
│   ├── linux.md             # Linux flashing instructions and verification
│   ├── macos.md             # macOS flashing instructions and verification
│   ├── troubleshooting.md   # Common issues and recovery steps
│   └── windows.md           # Windows flashing instructions and verification
└── scripts/
    ├── download_jetpack.sh  # Bash helper to fetch images and compute checksums
    └── download-jetpack.ps1 # PowerShell helper to fetch images and compute checksums
```

## Hardware Setup Overview

Before writing the image, assemble the physical kit and confirm you have these items ready:

- Jetson Orin Nano Developer Kit (carrier board, module, and power supply)
- microSD card (64 GB or larger, UHS-I or better recommended) plus a reliable card reader
- HDMI or DisplayPort monitor, USB keyboard, and mouse (or a serial console cable for headless setup)
- Optional peripherals, such as CSI camera, Wi-Fi/Bluetooth antennas, or M.2 storage

The dedicated [hardware assembly guide](docs/hardware-assembly.md) includes annotated diagrams that highlight the microSD slot orientation, antenna connectors, and mounting hole locations so you can avoid bent pins or loose cables when wiring the system.

## Download and Verify the Jetson Image

1. Visit the [JetPack 6.2 download page](https://developer.nvidia.com/embedded/jetpack-sdk-62) and download the Jetson Orin Nano Developer Kit SD card image (`.zip`).
2. Use one of the following checksum commands to confirm file integrity before flashing:

   ```bash
   # Linux or macOS
   sha256sum Jetson_Orin_Nano_Developer_Kit_SD_Card_Image.zip

   # Windows PowerShell
   Get-FileHash -Path .\Jetson_Orin_Nano_Developer_Kit_SD_Card_Image.zip -Algorithm SHA256
   ```

   Compare the output hash with the checksum published on NVIDIA's download page.

3. Prefer automation? Run `./scripts/download_jetpack.sh` (Linux/macOS) or `./scripts/download-jetpack.ps1` (Windows) to download the image, validate the checksum automatically, and log the steps for later reference.

Once the image is verified, move on to flashing with your preferred operating system workflow.

## Flash the Image

Detailed, OS-specific instructions now live in the `docs/` directory so they can grow independently:

- [Windows flashing guide](docs/windows.md)
- [macOS flashing guide](docs/macos.md)
- [Linux flashing guide](docs/linux.md)

Each guide includes Etcher walk-throughs, command-line alternatives, and platform-specific screenshots or prompts to watch for during the process.

## First Boot and Post-Install Tasks

After flashing, follow these steps to ensure the developer kit is up to date and reachable over the network:

1. Insert the prepared microSD card, connect the power supply, display, and input devices, then power on the Jetson Orin Nano.
2. Complete the on-screen setup wizard. When prompted, join a network so the device can obtain system updates.
3. Open a terminal and run:

   ```bash
   sudo apt update && sudo apt upgrade -y
   sudo apt install -y openssh-server net-tools
   ```

   These commands update the system, install OpenSSH for remote access, and add basic networking utilities.

4. (Optional) Enable remote desktop access with:

   ```bash
   sudo systemctl enable --now nvfb.service
   ```

   Alternatively, enable NVIDIA's built-in VNC server under **Settings → Sharing**.

5. Launch the NVIDIA SDK Manager or use `sudo apt install nvidia-jetpack` to install additional JetPack components such as CUDA, TensorRT, and multimedia APIs.
6. Reboot to finalize updates, then note the device's IP address for headless use.

## Next Steps and Learning Resources

- Explore NVIDIA's [Jetson Projects](https://developer.nvidia.com/embedded/community/jetson-projects) showcase for inspiration.
- Clone and build the [Jetson Inference](https://github.com/dusty-nv/jetson-inference) samples to validate GPU acceleration.
- Set up ROS 2 using NVIDIA's [ROS on Jetson resources](https://developer.nvidia.com/isaac-ros). These projects demonstrate real-world use cases once the base system is configured.

## Troubleshooting

Refer to the expanded [troubleshooting appendix](docs/troubleshooting.md) for recovery steps if flashing fails, Etcher throws an error, or the device does not boot after imaging. The appendix covers:

- Re-imaging with Etcher or `dd`
- Checking card health and interface speed
- Recovering from corrupted downloads
- Resetting user accounts on first boot

## Contributing

Contributions are welcome! Please open an issue or pull request with additional setup tips, screenshots, or localized translations. When adding new flashing workflows or hardware accessories, place documentation in `docs/` and link it from [`docs/index.md`](docs/index.md) so others can discover it quickly.

## References

- [Jetson Orin Nano Developer Kit Getting Started Guide](https://developer.nvidia.com/embedded/learn/get-started-jetson-orin-nano-devkit#write)
- [NVIDIA JetPack 6.2](https://developer.nvidia.com/embedded/jetpack-sdk-62)
