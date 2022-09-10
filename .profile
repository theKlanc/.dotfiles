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
export XDG_DATA_HOME=$HOME/.local/share

export QSYS_ROOTDIR="/home/klanc/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/20.1/quartus/sopc_builder/bin"
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk
export PATH=~/.local/bin:"$PATH"
export CMAKE_PREFIX_PATH=/opt/zephyr-sdk/cmake/
export PICO_SDK_PATH=/usr/share/pico-sdk/
export FREERTOS_KERNEL_PATH=/opt/FreeRTOS-Kernel/
