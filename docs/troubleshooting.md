# Troubleshooting Flashing and First Boot Issues

Use this appendix when flashing fails, validation errors appear, or the Jetson Orin Nano does not boot as expected.

## Flashing Issues

### Etcher Reports "Flash Failed"

1. Re-run Etcher with administrator/root privileges.
2. Try a different USB port or card reader to rule out hardware bottlenecks.
3. Delete the existing `.zip` file, re-download it, and recompute the checksum.
4. Inspect the SD card with the SD Association's Card Formatter or `f3probe` (Linux) to check for bad blocks.

### `dd` Appears to Hang or Takes Too Long

- Confirm that `status=progress` is present to view write updates.
- Reduce the block size if errors persist: `bs=4M` is a safe alternative.
- Run `sync` after `dd` to flush buffers before removing the card.

### Checksum Mismatch

- Ensure the downloaded `.zip` file is complete—compare its size against NVIDIA's listing.
- If your network is unstable, use the helper scripts (`download_jetpack.sh` or `download-jetpack.ps1`) to resume downloads and log retries.

## First Boot Problems

### Board Boots to Black Screen

- Double-check the display connection. The HDMI port is adjacent to the DisplayPort connector; ensure the cable is fully seated.
- Try a different monitor or cable. Some displays require a power cycle to detect new HDMI sources.
- Connect via serial console (`J501`) to verify the system is booting and check logs.

### Setup Wizard Fails or Loops

- Power-cycle the board and reinsert the microSD card to ensure it is seated.
- Reflash the card if the wizard cannot create the initial user account.

### No Network Connectivity

- Confirm Ethernet link lights. If none, swap the cable or port.
- For Wi-Fi, ensure antennas are firmly connected and the SSID password is correct.
- Enable SSH manually with `sudo systemctl enable --now ssh` after logging in locally.

## Recovering from a Corrupted microSD Card

1. Backup important data by mounting the card on another Linux system and copying files.
2. Re-run the flashing workflow from scratch after verifying the checksum.
3. Consider upgrading to an industrial-grade microSD card for improved endurance.

## Getting Help

- Check the [NVIDIA Developer Forums](https://forums.developer.nvidia.com/c/agx-autonomous-machines/70) for similar issues.
- Review system logs with `journalctl -xe` and `dmesg` to identify driver or hardware errors.
- When seeking assistance, provide your JetPack version, SD card model, and flashing method.
