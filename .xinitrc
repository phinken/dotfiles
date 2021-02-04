#!/bin/sh 

###############################################################
#    COPIED FROM X11 FOLDER ACCORDING TO A TUTORIAL ON YT     #
#    PROBABLY NOT NECESSARY, AS MANY OTHERS HAVE OMITED IT    #
#               MY OWN ADDITIONS ARE AT THE END               #
###############################################################

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


############################
#    STUFF I HAVE ADDED    #
############################



# Keyboard layout to Norwegian
# Swap Escape and CapsLock
# Swap positions of right Windows key with left Alt key
# Replace PrtSc key with righ Windows key
# All available -option arguments are found at:
# https://gist.github.com/jatcwang/ae3b7019f219b8cdc6798329108c9aee 
exec setxkbmap no -option caps:swapescape -option altwin:swap_lalt_lwin -option altwin:prtsc_rwin &

# Compositor
exec picom &

# Wallpaper / background
exec feh --bg-fill ~/Pictures/wallpapers/jungle_waterfall.jpg &

# Execute window manager
#exec dwm
exec spectrwm
