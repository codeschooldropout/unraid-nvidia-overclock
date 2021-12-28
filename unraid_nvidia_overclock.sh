#!/bin/bash
# This Unraid User Script is used to prepare a NVIDIA GPU (3060) for mining after the array starts for the first time.
# This script requires the Nvidia-Driver plugin https://forums.unraid.net/topic/98978-plugin-nvidia-driver/
# In order to run nvidia-settings (set core clock, memory clock, fan, etc.), X must be started temporarily.
# In this script, "/mnt/user/bin/3060/" is the cache drive directory used for dependecies and configuration files.
# It is recommended to download the depencies to a cache drive instead of downloading them on each boot. After these dependencies are
# downloaded, delete the following section:
#-------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------
# Download 43 packages to run nvidia-settings... ugh. It's only 41.8MB.
# Download them all simultaneously in about 2 seconds on a gigabit FTTC connection
cd /mnt/user/bin/3060/
echo "https://slackware.uk/slackware/slackware64-14.2/slackware64/x/xorg-server-1.18.3-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/xinit-1.3.4-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libxcb-1.11.1-x86_64-1.txz 
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXau-1.0.8-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXdmcp-1.1.2-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/n/nettle-3.2-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libdrm-2.4.68-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXfont-1.5.1-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/l/harfbuzz-1.2.7-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/l/freetype-2.6.3-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libfontenc-1.1.3-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libxshmfence-1.2-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/xkeyboard-config-2.17-noarch-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/xkbcomp-1.3.0-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libxkbfile-1.0.9-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/xterm-325-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXft-2.3.2-x86_64-3.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/fontconfig-2.11.1-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXaw-1.0.13-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXmu-1.1.2-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXt-1.1.5-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXinerama-1.1.3-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXpm-3.5.11-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libICE-1.0.9-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXrender-0.9.9-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXext-1.3.3-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libSM-1.2.2-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/l/gtk+2-2.24.30-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/l/atk-2.18.0-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/l/gdk-pixbuf2-2.32.3-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/l/pango-1.38.1-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXi-1.7.6-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXrandr-1.5.0-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXcursor-1.1.14-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXcomposite-0.4.4-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/l/cairo-1.14.6-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/mesa-11.2.2-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXdamage-1.1.4-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXv-1.0.10-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXfixes-5.0.2-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/x/libXxf86vm-1.1.4-x86_64-2.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/d/gdb-7.11.1-x86_64-1.txz
https://slackware.uk/slackware/slackware64-14.2/slackware64/d/python-2.7.11-x86_64-2.txz
" | xargs -n 1 -P 43 wget
#-------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------

upgradepkg --install-new /mnt/user/bin/3060/xorg-server-1.18.3-x86_64-2.txz
upgradepkg --install-new /mnt/user/bin/3060/xinit-1.3.4-x86_64-2.txz
upgradepkg --install-new /mnt/user/bin/3060/libxcb-1.11.1-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXau-1.0.8-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXdmcp-1.1.2-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/nettle-3.2-x86_64-1.txz
upgradepkg --install-new /mnt/user/bin/3060/libdrm-2.4.68-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXfont-1.5.1-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/harfbuzz-1.2.7-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/freetype-2.6.3-x86_64-1.txz
upgradepkg --install-new /mnt/user/bin/3060/libfontenc-1.1.3-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/libxshmfence-1.2-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/xkeyboard-config-2.17-noarch-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/xkbcomp-1.3.0-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/libxkbfile-1.0.9-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/xterm-325-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXft-2.3.2-x86_64-3.txz 
upgradepkg --install-new /mnt/user/bin/3060/fontconfig-2.11.1-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXaw-1.0.13-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXmu-1.1.2-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXt-1.1.5-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXinerama-1.1.3-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXpm-3.5.11-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/libICE-1.0.9-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXrender-0.9.9-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXext-1.3.3-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/libSM-1.2.2-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/gtk+2-2.24.30-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/atk-2.18.0-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/gdk-pixbuf2-2.32.3-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/pango-1.38.1-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXi-1.7.6-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXrandr-1.5.0-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXcursor-1.1.14-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXcomposite-0.4.4-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/cairo-1.14.6-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/mesa-11.2.2-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXdamage-1.1.4-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXv-1.0.10-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXfixes-5.0.2-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/libXxf86vm-1.1.4-x86_64-2.txz 
upgradepkg --install-new /mnt/user/bin/3060/gdb-7.11.1-x86_64-1.txz 
upgradepkg --install-new /mnt/user/bin/3060/python-2.7.11-x86_64-2.txz
# Reset cards just in case
nvidia-smi -r
# Enable persistence
nvidia-smi -pm 1
# Set power limit (in watts)
nvidia-smi -pl 109
# Generate /etc/X11/xorg.conf using virtual displays (THIS IS NOT AN OPTIMAL CONFIGURATION... will work on this)
nvidia-xconfig --cool-bits=31 --allow-empty-initial-configuration --use-display-device=None --virtual=304x200 --enable-all-gpus --separate-x-screens
# Ideally, create an optimized xorg.conf and copy it. Uncomment the following line to copy optimized configuriation:
#cp /mnt/user/bin/3060/xorg.conf /etc/X11/xorg.conf.d/
# "Ensure the DISPLAY environment variable is set correctly." (to virtual display?)
export DISPLAY=:0.0
# Start Xorg display server temporarily with xinitrc script to call nvidia-settings while X is running
xinit /mnt/user/bin/3060/oc.xinitrc -- /usr/bin/X -br
# oc.xinitrc should contain calls to nvidia-settings. ie:
#   nvidia-settings -a [gpu:0]/GPUPowerMizerMode=2 --use-gtk2
#   nvidia-settings -a [gpu:0]/GPUMemoryTransferRateOffsetAllPerformanceLevels=1400 --use-gtk2
#   nvidia-settings -a [gpu:0]/GPUGraphicsClockOffsetAllPerformanceLevels=-200 --use-gtk2
#   nvidia-settings -a [gpu:0]/GPUFanControlState=1 --use-gtk2
#   nvidia-settings -a [fan:0]/GPUTargetFanSpeed=78 --use-gtk2
#   nvidia-settings -a [fan:1]/GPUTargetFanSpeed=78 --use-gtk2