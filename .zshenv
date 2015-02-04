export SHELL=`which zsh`
export EDITOR=vim
export SVN_EDITOR=vim

PATH=/usr/local/php5/bin:/usr/local/bin:/fractal/home/n-murayama/bin:/Users/murayama/bin:$PATH
export PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export RSENSE_HOME=$HOME/lib/rsense-0.3
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
#=============================
# rbenv
#=============================
if [ -d ${HOME}/.rbenv  ] ; then
  PATH=${HOME}/.rbenv/bin:${PATH}
  export PATH
  eval "$(rbenv init -)"
  source ~/.rbenv/completions/rbenv.zsh
fi

if [ -d ${HOME}/.go ] ; then
  PATH=${HOME}/.go/bin:${PATH}
  export GOPATH=~/.go
  export PATH
fi

# swift
export PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH
