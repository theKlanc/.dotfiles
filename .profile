[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"
export PATH=$HOME/.scripts/:$PATH
#export FONTCONFIG_FILE=/etc/fonts/
export MAKEFLAGS="-j$(($(nproc)-1))"
export EDITOR=vim
export DEVKITPRO="/opt/devkitpro"
export DEVKITARM="$DEVKITPRO/devkitARM"
export DEVKITA64="$DEVKITPRO/devkitA64"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
export _JAVA_AWT_WM_NONREPARENTING=1
