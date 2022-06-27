# colors
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# chmod
alias c="chmod +rwx"

# connectivity
alias sshHome="ssh bonsq@$PCFIXE"

# clipboard
alias xclip="xclip -sel clip"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Vim
alias v=nvimfg
alias vi=nvim
alias vim=nvim

# Xppen
alias xppen="/usr/lib/pentablet/pentablet"

# time
alias synctime="sudo ntpd -qg ; sudo hwclock --systohc && echo 'Success'"
