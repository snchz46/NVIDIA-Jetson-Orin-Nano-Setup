# NVIDIA Jetson Orin Nano Setup
> A guide by Samuel Sanchez, Master student at Hochschule Esslingen

## Jetson Orin Nano Developer Kit Getting Started Guide

To prepare your microSD card, you’ll need a computer with Internet connection and the ability to read and write SD cards, either via a built-in SD card slot or adapter. An SD Card with at least 64Gb is recommended.

- Download the Jetson Orin Nano Developer Kit SD Card image from [JetPack 6.2](https://developer.nvidia.com/embedded/jetpack-sdk-62), and note where it was saved on the computer.
  
It is recommended to download the card image and then put it into an SD Card using other software.

<img width="1325" height="345" alt="e80fd77401bef8350de198dfa67f2889" src="https://github.com/user-attachments/assets/bbdbfa72-f09b-48a2-a7c8-5dfc39ec6a58" />

- Write the image to your microSD card by following the instructions below according to the type of computer you are using: Windows or Mac.
  
## Windows installation


Format your microSD card using SD Memory Card Formatter from the SD Association.

<img width="392" height="429" alt="Jetson_Nano-Getting_Started-Windows-SD_Card_Formatter" src="https://github.com/user-attachments/assets/c07d15ce-8b4d-485f-a805-85e1a11380ec" />


- Download, install, and launch SD Memory Card Formatter for Windows.
- Select card drive
- Select “Quick format”
- Leave “Volume label” blank
- Click “Format” to start formatting, and “Yes” on the warning dialog

Use Etcher to write the SD card image to your microSD card

- Download, install, and launch Etcher.

<img width="512" height="325" alt="Jetson_Nano-Getting_Started-Windows-Etcher" src="https://github.com/user-attachments/assets/c759467b-107a-4ad5-a099-b0165b0ce6ab" />
    
- Click “Select image” and choose the zipped image file downloaded earlier.
- Insert your microSD card if not already inserted.
- Click Cancel (per this explanation) if Windows prompts you with a dialog like this:
- Click “Select drive” and choose the correct device.
- Click “Flash!” It will take Etcher about 15 minutes to write and validate the image if your microSD card is connected via USB3.
- After Etcher finishes, Windows may let you know it doesn’t know how to read the SD Card. Just click Cancel and remove the microSD card.

After your microSD card is ready, proceed to set up your developer kit.


## MAC installation

You can either write the SD card image using a graphical program like Etcher.
Etcher Instructions

- Do not insert your microSD card yet.
- Download, install, and launch Etcher.

<img width="512" height="243" alt="Jetson_Nano-Getting_Started-Mac-Etcher" src="https://github.com/user-attachments/assets/84304c21-43f5-4b41-8012-5085dbcd8f76" />

- Click “Select image” and choose the zipped image file downloaded earlier.
- Insert your microSD card. Click Ignore if your Mac shows this window:

<img width="440" height="156" alt="Jetson_Nano-Getting_Started-Mac-Disk_readable" src="https://github.com/user-attachments/assets/e9a44c1f-a881-4af3-867c-2494fcbaf401" />

- If you have no other external drives attached, Etcher will automatically select the microSD card as target device. Otherwise, click “Select drive” and choose the correct device.
- Click “Flash!” Your Mac may prompt for your username and password before it allows Etcher to proceed

<img width="443" height="232" alt="Jetson_Nano-Getting_Started-Mac-Etcher_permission" src="https://github.com/user-attachments/assets/cef85adb-1505-4c00-96ad-320a23db2b5c" />

It will take Etcher about 10 minutes to write and validate the image if your microSD card is connected via USB3.
- After Etcher finishes, your Mac may let you know it doesn’t know how to read the SD Card. Just click Eject and remove the microSD card.

<img width="440" height="156" alt="Jetson_Nano-Getting_Started-Mac-Disk_readable" src="https://github.com/user-attachments/assets/663cb786-39be-4060-ba0e-7986173a5a1b" />



## References used on this guide

- [Jetson Orin Nano Developer Kit Getting Started Guide](https://developer.nvidia.com/embedded/learn/get-started-jetson-orin-nano-devkit#write)
- [NVIDIA JetPack 6.2](https://developer.nvidia.com/embedded/jetpack-sdk-62)
