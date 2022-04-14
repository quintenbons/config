#!/usr/bin/env sh
cpConfirm () {
    cp $1 $2;

    if [ ! $? -ne 0 ] ; then
        # copie effectuee
        echo "Copied \033[0;32m$1\033[0m to \033[0;32m$2\033[0m.";
    fi
}

WARNME="Are you sure you want to \033[0;31mreplace your local\033[0m files (y)?"
read -p "$(echo $WARNME) " choice

case "$choice" in
    y|Y )
        scriptDir=$(dirname $0);
        cpConfirm "$scriptDir/.variables.sh" "$HOME/.variables.sh";
        cpConfirm "$scriptDir/.aliases.sh" "$HOME/.aliases.sh";
        cpConfirm "$scriptDir/.github.sh" "$HOME/.github.sh";
        cpConfirm "$scriptDir/.utilities.sh" "$HOME/.utilities.sh";
        cpConfirm "$scriptDir/.bashrc" "$HOME/.bashrc";
        cpConfirm "$scriptDir/.vimrc" "$HOME/.vimrc";
        ;;

    * )
        echo "Aborted";
        ;;
esac
