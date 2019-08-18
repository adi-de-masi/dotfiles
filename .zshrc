# Path to your oh-my-zsh configuration.
export TERM="xterm-256color"
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerline"

#ZSH_THEME="pygmalion"
#ZSH_THEME="powerline"
ZSH_THEME="powerlevel9k/powerlevel9k"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)

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

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:/Users/dea/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/dea/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/MacGPG2/bin:/Users/dea/bin:/opt/apache/apache-maven-3.0.3//bin:/Applications/MacVim.app/Contents/MacOS/Vim:/Users/dea/Documents/downloads/java/play-2.1.1
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
export PATH=/Users/dea/Library/Python/2.7/bin:$PATH
export PATH=/usr/local/opt/python@2/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
#export FELIX_HOME=/Users/dea/panter/src/ent-001/matterhorn
export MH_HOTDEPLOY=/Users/dea/panter/src/ent-001/matterhorn-configuration/vagrant/share/matterhorn
export KARAF_ROOT=/Users/dea/panter/src/ent-001/matterhorn/build
export GLASSFISH_AUTODEPLOY=/Users/dea/Documents/downloads/java/glassfish4/glassfish/domains/domain1/autodeploy
export M2_HOME=/opt/apache-maven-3.5.0/
export M2=$M2_HOME/bin
export PATH=$PATH:$M2
export M2_REPO=~/.m2/repository
export EDITOR=/usr/bin/edit
export RSENSE_HOME=/Users/dea/bin/vim-rsense-0.3
export TOMEE_HOME=/opt/apache/apache-tomee-plus-1.6.0
export TESSDATA_PREFIX=/usr/local/Cellar/tesseract/3.04.01_2/share/ 
export ANDROID_HOME=/Users/dea/Library/Android/sdk
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home"
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home
#export JAVA_HOME="/Library/Java/1.6.0_37-b06-434.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home"
#export ANDROID_HOME=/Users/dea/Documents/downloads/java/adt-bundle-mac-x86_64-20130219/sdk
#export MAVEN_OPTS="-Xms512m -Xmx2048m -XX:PermSize=512m -XX:MaxPermSize=2048m -Djavax.net.ssl.trustStore=/Users/dea/.m2/panterTrust.jks"
export IDEA_VM_OPTIONS=/Users/dea/Documents/assets/intellij/idea.vmoptions
export FLYWAY_HOME=/Users/dea/Documents/source/flyway
export HOMEBREW_GITHUB_API_TOKEN=1dc7844ddf66e83851f35a1cf5865c3ebe0f20c4
alias vim='/usr/local/bin/mvim -v'
alias vi='/usr/local/bin/mvim -v'
alias ll='ls -la'
set -o vi

#OktaAWSCLI
if [[ -f "$HOME/.okta/bash_functions" ]]; then
    . "$HOME/.okta/bash_functions"
fi
if [[ -d "$HOME/.okta/bin" && ":$PATH:" != *":$HOME/.okta/bin:"* ]]; then
    PATH="$HOME/.okta/bin:$PATH"
fi

###-tns-completion-start-###
if [ -f /Users/dea/.tnsrc ]; then 
    source /Users/dea/.tnsrc 
fi
###-tns-completion-end-###
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
## don't cd automatically
#unsetopt AUTO_CD
#[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
setopt histignorespace

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/dea/.sdkman"
[[ -s "/Users/dea/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dea/.sdkman/bin/sdkman-init.sh"


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
