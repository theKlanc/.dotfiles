[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"
export PATH=$HOME/.scripts/:$PATH
#export FONTCONFIG_FILE=/etc/fonts/
export MAKEFLAGS="-j$(nproc)"
export EDITOR=vim
export DEVKITA64="$DEVKITPRO/devkitA64"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'