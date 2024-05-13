###########################
#                         #
# Zer0theory's ~/.bashrc  #
#                         #
###########################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set vim as default editor.
export EDITOR='vim'

# Check and source bash completion
# This may not be needed
# if [ -f /usr/share/bash-completion/bash_completion ]; then
# 	. /usr/share/bash-completion/bash_completion
# fi

# History settings
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=3000

# Set vi mode in terminal. i and esc function in command line
set -o vi

# Prevent > from accidently clobbering your file like >> appends
set -o noclobber

# Using neovim to navigate and colorize man pages
export MANPAGER='nvim +Man!'

# Custom random PS1 prompt each start
randomprompt=$((RANDOM%7))
case $randomprompt in 
  "0") PS1='\[\033[1;30m\]-= \w =- \[\033[0;0m\]\n    \[\033[0;0m\]' ;;
  "1") PS1='\[\033[1;30m\][\[\033[1;34m\]\u\[\033[0;0m\]@\[\033[1;33m\]\h\[\033[0;0m\]\[\033[1;30m\]]\n [\[\033[1;31m\]\w\]\[\033[0;31m\]\[\033[1;30m\]]\[\033[1;32m\] \[\033[0;0m\] ' ;;
  "2") PS1="\[\033[0;35m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;35m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[1;34m\]\u\[\033[0;32m\]@\[\033[0;34m\]\h'; fi)\[\033[0;35m\]]\342\224\200(\[\033[0;32m\]\w\[\033[0;35m\])\n\[\033[0;35m\]\342\224\224\342\224\200\342\224\200\[\033[1;31m\] ﰁ๛ \[\033[0m\]" ;;
  "3") PS1='-= \w =-\n 🕱 ';;
  "4") PS1='\[\033[01;30m\] \d \@\n \[\033[01;30m\]user:\[\033[0;36m\] \u\n \[\033[01;30m\]host:\[\033[0;35m\] \h\n \[\033[1;30m\]shell: \[\033[0;32m\]\s\n \[\033[01;30m\]count: \[\033[0;33m\]\#\n \[\033[01;30m\]pwd: \[\033[01;31m\]\w\n \[\033[01;32m\]\$ \[\033[0;00m\]';;
  "5") PS1='\[\033[01;34m\] 𐦉 \w 𐦞 \[\033[0;0m\]\n \[\033[01;32m\] 𐦝  \[\033[0;0m\]';;
  "6") export PS1="\[\e[0;34m\]╭── \[\e[1;32m\]\u \[\e[1;31m\]@ \[\e[0;34m\]\h \[\e[1;31m\]──\n\[\e[0;34m\]│ \[\e[1;33m\]\w \[\e[0;34m\]│\n\[\e[0;34m\]╰─\[\e[1;35m\]▶ \[\e[0m\]"
esac

# Custom aliases
alias ls='lsd --color=auto'
alias grep='grep --color=auto'
alias x='exit'
#alias c='clear'
alias c='clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat'
alias fetch='clear && fastfetch -l Arch'
alias ll='lsd -lah --group-directories-first'
alias top='gotop -c solarized'
alias reflect='sudo reflector --country US --sort rate --latest 20 --protocol https --save /etc/pacman.d/mirrorlist --verbose'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias mv='mv -iv'
alias cp='cp -iv'
alias weather='curl wttr.in'
alias matrix='tmatrix -c default -C magenta'
alias ip='ip -color=auto'
alias kermit='curl -s https://www.reactiongifs.com/r/ktpng.gif | chafa -d 15 -s 30'
alias stank='curl -s https://www.reactiongifs.com/wp-content/uploads/2013/11/baby-dance.gif | chafa -d 15 -s 30'
alias clear-cache='paccache -r' # Clears package cache except last 3 versions
alias nv='nvim'
alias vim='nvim'
alias vi='nvim'
alias macOS='cd && cd gitz/OSX-KVM && ./OpenCore-Boot.sh && cd'
alias wal='wal1'
alias emoji='rofi -show emoji'
alias gearlever='flatpak run it.mijorus.gearlever'
alias open='xdg-open' # uses systems default program
alias nano='figlet "Just say na-NO!"|lolcat'
alias files='yazi'

if [ -f ~/.bash_personal ]; then
      . ~/.bash_personal
fi


# Custom Cows
#mycow=$((RANDOM%6))
#case $mycow in
#  "0") fortune | cowsay -f sodomized | lolcat ;;
#  "1") fortune | cowsay -f small | lolcat  ;;
#  "2") fortune | cowsay -f ghostbusters | lolcat ;;
#  "3") fortune | cowsay -f eyes | lolcat ;;
#  "4") fortune | cowsay -f daemon | lolcat ;;
#  "5") fortune | cowsay -f bunny | lolcat ;;
#esac
# Moved to mycow script


# Custom terminal starts
promptstart=$((RANDOM%7))
case $promptstart in 
  "0") fetch | lolcat ;;
  "1") figlet $USER -f Bloody | lolcat ;;
  "2") weather ;;
  "3") mycow ;;
  "4") fortune | lolcat ;;
  "5") neofetch --backend kitty --source /home/zero/Pictures/arch-linux-icon-md-253589589.png --size 30%;;
  "6") fastfetch -l blackarch --pipe false | lolcat;;
esac


# Default bash PS1 prompt incase shit breaks
#PS1='[\u@\h \W]\$ '

export PATH="$PATH:/home/zero/.local/bin"

export BAT_THEME='TwoDark'

#pyenv 
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
