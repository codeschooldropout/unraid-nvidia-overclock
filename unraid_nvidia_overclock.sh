#!/bin/bash
#name=unraid_nvidia_overclock.sh
#description=Helper userscript to configure nvidia cards extended power and speed settings while headless
#backgroundOnly=false

# Location used for install and settings cache - change to your repo location
APPDIR="/mnt/user/appdata/nvidia-overclock"

mkdir -p "$APPDIR/installs"
cd $APPDIR

# Install xorg-server and dependencies, hopefully as few as possible to get working in Unraid
# Check slackware version to determine which version of Unraid we are in

VERSION=$(grep '^VERSION=' /etc/os-release | cut -d '=' -f 2 | sed 's/"//g')

case $VERSION in
  14.2)
    echo "Installing packages for Unraid 6.9"
    # This list was in the original forked gist and is untested
    ;;
  15.0)
    echo "Installing packages for Unraid 6.10"
    ;;
  *)
    echo "Error: Unknown Version"
    exit 1
    ;;
esac

# Download list of packages from correct list of URLs if they do not already exist
wget -nc -P "$APPDIR/installs" -i "$APPDIR/packages-$VERSION.lst"

# Install package files
cd "$APPDIR/installs/"

for i in *.txz; do
    [ -f "$i" ] || break
    upgradepkg --install-new "$i"
done

# Generate xorg.conf if one doesn't exist, you may want to edit to optimize for your setup
if [[ -f "$APPDIR/xorg.conf" ]]
then
  cp -n "$APPDIR/xorg.conf" /etc/X11/xorg.conf
else
  nvidia-xconfig --cool-bits=31 --allow-empty-initial-configuration --enable-all-gpus
  cp -n /etc/X11/xorg.conf $APPDIR
fi

# Copy example overclock.xinitrc file if one does not exist
# Need to edit overclock.xinitrc and configure for your video card(s)
[ ! -f "$APPDIR/overclock.xinitrc" ] && cp "$APPDIR/overclock.xinitrc.example" "$APPDIR/overclock.xinitrc"

# Start xinit on console to run nvidia-settings
export DISPLAY=:0.0 
xinit $APPDIR/overclock.xinitrc -- /usr/bin/X -br