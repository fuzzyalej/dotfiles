# rvm
[[ -s "/Users/dev/.rvm/scripts/rvm" ]] && source "/Users/dev/.rvm/scripts/rvm"

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
 
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
 
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
 
PS1='\u@\h:\w\[\033[32m\]$(__git_ps1)\[\033[00m\]\$ '

alias gc="git commit"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gs="git status"
alias ga="git add ."
