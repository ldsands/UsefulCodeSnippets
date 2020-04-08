# OBS Studio

OBS Studio (or OBS) is a video and sound manager that is often used by streamers, video makers, and podcast producers for managing both video and sound output for their desired platform. With the corona virus quarantine/lockdown I took a peak to see if I could make any improvements to my video and audio setup so that I don't look and sound quite so bad on all of these zoom meetings that we're having.

## OBS Installation

First you need to download [OBS](https://obsproject.com/) (or you can use chocolatey by entering this code into powershell `choco install obs`)

Also, for some of the steps that I will be doing you will need to install a separate plugin from [this site](https://github.com/CatxFish/obs-virtual-cam/releases). Just get the exe it is easier that way.

## Basic OBS concepts

OBS has scenes or different "outputs" if you will. For each scene you can enter whatever inputs you want such as just video (from a webcam and or a program such as PowerPoint, etc.) or you can include audio as well.

I create a video output that can have all of the settings from OBS that I want and then use that output video (using the VirtualCam plugin) as the source for my Zoom meetings (or any other program that uses video).

You can do the same thing with audio too. For example I do remove some background noise from my microphone.

## Video output instructions

This is taken directly from the VirtualCam [OBS Fourm site](https://obsproject.com/forum/resources/obs-virtualcam.539/):

How to use:
Output:
1. Selecting Tools -> VirtualCam
2. Press start button and close diailog
3. Open your 3rd party program and choose "OBS-Camera" as a Video input

Or [here is a video](https://www.youtube.com/watch?v=IT871dHHZRU) about using VirtualCam.

Once you have this all set up you can use normal OBS settings to set up your webcam how you want to. [Here is a good introductory video](https://www.youtube.com/watch?v=r7teWxV5BCE).

## Improving audio quality

I would really like to reduce the background noise (particularly from my mechanical keyboard)

Be aware this is pretty involved. You will also need to install [Voicemeeter] (https://www.vb-audio.com/Voicemeeter/potato.htm)(get the potato version it is basically the 3.0 name they've given it).

[Here is the video](https://www.youtube.com/watch?v=noqKxopwp74) I used as a guide to enable those settings. I left everything at default since they all seemed to work fine (I did not enable the gain because my volume was fine to begin with).

[Here is another video](https://www.bing.com/videos/search?q=listen+to+mic+through+obs&view=detail&mid=98DC86C40ADFCE6494ED98DC86C40ADFCE6494ED&FORM=VIRE) that shows you how to listen to the microphone output from OBS (for testing).