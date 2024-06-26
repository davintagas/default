# System-wide .bashrc file

# Continue if running interactively
[[ $- == *i* ]] || return 0
alias update='opkg update'
export HISTTIMEFORMAT="%d/%m/%y %T "
export PS1='\u@\h:\W \$ '
alias l='ls -CF'alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
export PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "

[ \! -s /etc/shinit ] || . /etc/shinit
