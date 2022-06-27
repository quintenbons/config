#!/usr/bin/env zsh
cpConfirm () {
    cp -r $1 $2;

    if [ ! $? -ne 0 ] ; then
        # copie effectuee
        echo "Copied \033[0;32m$1\033[0m to \033[0;32m$2\033[0m.";
    fi
}

WARNME="Are you sure you want to \033[0;31mreplace your local (to local) \033[0m files (y)?"

if read -q "choice?$WARNME" ; then
    echo
    scriptDir=$(dirname $0);
    mkdir ~/.cd_bookmarks;
    cpConfirm "$scriptDir/.zshrc" "$HOME/.zshrc";
    cpConfirm "$scriptDir/.vimrc" "$HOME/.vimrc";
    cpConfirm "$scriptDir/.config/zshrc" "$HOME/.config/";
    cpConfirm "$scriptDir/.config/i3" "$HOME/.config/";
    cpConfirm "$scriptDir/.config/i3status" "$HOME/.config/";
    cpConfirm "$scriptDir/.config/kitty" "$HOME/.config/";
    cpConfirm "$scriptDir/.config/nvim" "$HOME/.config/";
    cpConfirm "$scriptDir/.config/picom" "$HOME/.config/";
else
    echo
    echo "Aborted";
fi;
