# Load the default profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

#RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

#git bash integration
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

#Git Config
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

#Aliases
## GIT
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gru='git remote update'
alias gpu='git pull'
alias gcl='git clone'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gpp='git pull --rebase && git push'
alias gmf='git merge --ff-only'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

## General goodies
alias emacs="open /Applications/Emacs.app"
alias grep='grep --color'
alias clj='rlwrap clj'
alias tunnel='sshuttle -D --pidfile=/tmp/sshuttle.pid --dns 0/0 -r'
alias stoptunnel='[[ -f /tmp/sshuttle.pid ]] && kill `cat /tmp/sshuttle.pid`'
alias map="xargs -n1"
alias password="ruby -e 'require \"securerandom\";puts SecureRandom.base64[0...-2]'"
alias sbcl='rlwrap /usr/local/bin/sbcl'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias post="curl -i -X POST"
alias get="curl -i -X GET"
alias put="curl -i -X PUT"

# Servers
# -- not for your eyes --


# Nice bash indicator for background jobs
function __jobs {
  if [ ! $1 -eq 0 ]; then
    echo "* "
  fi
}
PS1='\[\033[31m\]$(__jobs \j)\[\033[00m\]\u@\h:\w\[\033[32m\]$(__git_ps1)\[\033[00m\]\$ '

set show-all-if-ambiguous on
set completion-ignore-case on

# ENV Configuration
export EDITOR='vim'
