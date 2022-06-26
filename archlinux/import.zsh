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
    cpConfirm "$scriptDir/.config/zshrc" "$HOME/.config/zshrc";
    cpConfirm "$scriptDir/.zshrc" "$HOME/.zshrc";
    cpConfirm "$scriptDir/.vimrc" "$HOME/.vimrc";
else
    echo
    echo "Aborted";
fi;
