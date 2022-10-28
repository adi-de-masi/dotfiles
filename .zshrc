# Path to your oh-my-zsh configuration.
export TERM="xterm-256color"
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="evan"

export EDITOR="$(which vim)"

# git aliases
alias cgs='clear; git status'
alias ga='git add'
alias gp='git push'
alias gitlog="git log --pretty=format:'%Cred%h %Cgreen%ad %Cblue%aN %Creset%s' --date=iso"
alias gs='git status'
alias gd='git diff'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'

# Dotfiles repo
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no

# Key bindings
bindkey "^p" history-beginning-search-backward
bindkey "^[n" history-beginning-search-forward
bindkey -M viins '^r' history-incremental-pattern-search-backward
bindkey -M vicmd '^r' history-incremental-pattern-search-backward

# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:/Users/dea/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/dea/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/MacGPG2/bin:/Users/dea/bin:/opt/apache/apache-maven-3.0.3//bin:/Users/dea/Documents/downloads/java/play-2.1.1
export NODE_PATH="/usr/local/lib/node_modules"
export PATH=$NODE_PATH:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/Users/dea/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH
export PATH=/Users/dea/Documents/downloads/java/play/activator-1.2.2-minimal:$PATH
export PATH=/Library/PostgreSQL/9.3/bin:$PATH
export GROOVY_HOME=/usr/local/Cellar/groovy/2.1.1/libexec
export GRAILS_HOME=/Users/dea/bin/grails/grails-2.2.3
export PATH=$GRAILS_HOME/bin:$PATH
export PATH=/Users/dea/bin:$PATH
export PATH=/Users/dea/Library/Python/3.8/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export M2_HOME=/opt/apache-maven-3.5.0/
export M2=$M2_HOME/bin
export PATH=$PATH:$M2
export M2_REPO=~/.m2/repository
export EDITOR=/usr/bin/edit
export RSENSE_HOME=/Users/dea/bin/vim-rsense-0.3
export TOMEE_HOME=/opt/apache/apache-tomee-plus-1.6.0
export TESSDATA_PREFIX=/usr/local/Cellar/tesseract/3.04.01_2/share/ 
export ANDROID_HOME=/Users/dea/Library/Android/sdk
export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"
export IDEA_VM_OPTIONS=/Users/dea/Documents/assets/intellij/idea.vmoptions
export FLYWAY_HOME=/Users/dea/Documents/source/flyway
alias ll='ls -la'
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
set -o vi

# HISTIGNORESPACE prevents the current line from being saved if it begins with a space.
setopt histignorespace

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew tmux zsh-vi-mode)

if [[ -f "$HOME/.okta/bash_functions" ]]; then
    . "$HOME/.okta/bash_functions"
fi
if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
    PATH="$HOME/.okta/bin:$PATH"
fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

function aws_login() {
  login_cmd="python3 ~/bin/inject_aws_keys.py $1"
  eval "\$($login_cmd)"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
