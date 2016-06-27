
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# Trigger ~/.bashrc commands
. ~/.bashrc

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

alias up="cd .."
alias cmp="docker-compose"
alias apt-list="dpkg --get-selections | grep -v deinstall"

# Rails
alias rc="bundle exec rails c"
alias rs="bundle exec rails s"
alias bi="bundle install --path vendor/bundle"
alias rmigrate="bundle exec rake db:migrate"

# Rspec
alias rtest="bundle exec rspec"

function rtest {
  bundle exec rspec $1
}

function rsp {
  bundle exec rails s -p $1
}

# Git
alias gco='git checkout'
alias gst='git status'

# TMUX
function tmuxa {
  tmux a -t $1
}

function tmuxls {
  tmux ls
}

function tmuxn {
  tmux new -s $1
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
