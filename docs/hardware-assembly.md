# Jetson Orin Nano Hardware Assembly Guide

This guide expands on the high-level checklist by walking through the physical setup of the developer kit. While photos are not bundled directly in the repository, the instructions call out the same reference points used in NVIDIA's documentation so you can match them with the board silkscreen and official diagrams.

## 1. Unbox and Inspect Components

- Verify that you have the carrier board, Jetson Orin Nano module (pre-installed on most kits), 19V power supply, and rubber feet or standoffs.
- Inspect the microSD slot on the underside of the carrier board. Note the notch orientation—it should face the outer edge of the board.

## 2. Add Standoffs or Case Mounts (Optional)

- If you plan to mount the board into an enclosure, install the standoffs before connecting peripherals.
- Align the mounting holes on the carrier board with the case posts and secure them using M2.5 screws.

## 3. Connect Antennas and Cameras

- For Wi-Fi/Bluetooth modules, gently press the u.FL connectors straight down onto the matching sockets labeled `WIFI` and `BT`.
- Route antenna cables along the board edge to avoid obstructing the heatsink airflow.
- Attach CSI cameras by lifting the retaining clip on the CSI connector, inserting the ribbon cable with the contacts facing down, and closing the clip evenly.

## 4. Insert the microSD Card

1. Hold the microSD card with the contacts facing up.
2. Slide the card into the slot until it clicks. The card label should face the heatsink.
3. Tug gently to confirm it is locked in place.

## 5. Attach Peripherals

- Connect a display via HDMI or DisplayPort.
- Plug in a USB keyboard and mouse. If you plan to run headless, connect a micro-USB serial cable to the UART header (`J501`) or prepare to enable SSH after the first boot.
- Optional: connect an Ethernet cable for wired networking.

## 6. Power Connections and First Power-On

1. Plug the barrel connector from the power supply into the jack labeled `DC IN`.
2. Verify that the power switch (`SW1`) is in the **On** position.
3. Apply power. The green status LED should illuminate within a few seconds.

## 7. Safety and Thermal Tips

- Place the kit on a flat, non-conductive surface with ventilation clearance around the heatsink.
- Avoid covering the fan exhaust when placing the board inside a case.
- Consider adding a small USB-powered fan if you will run prolonged GPU-intensive workloads.

For visual context, compare these steps with NVIDIA's official [hardware diagrams](https://developer.nvidia.com/embedded/learn/jetson-orin-nano-devkit-user-guide). You can also capture your own annotated photos and add them to this repository's `docs/images/` directory for future contributors.
