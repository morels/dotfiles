# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/luca/.oh-my-zsh"

# Path to your JAVA_HOME. 
# More info here: https://www.mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/
export JAVA_HOME=$(/usr/libexec/java_home)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Heroku autocompletion
# NOTE: It MUST be placed before calling compinit, that is being called by oh-my-zsh.sh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  macos
)

source $ZSH/oh-my-zsh.sh

# Syntax highlightig
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

####################################################################################
# node nvm
####################################################################################
# for further info see here https://blog.teamtreehouse.com/install-node-js-npm-mac
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# You can set $NVM_DIR to any location, but leaving it unchanged from
# /usr/local/opt/nvm will destroy any nvm-installed Node installations
# upon upgrade/reinstall.
#
# Type `nvm help` for further information.
#
# To uninstall nvm please use the following commands ONCE:
# $ nvm deactivate
# $ rm -rf $NVM_DIR ~/.npm ~/.bower ~/.nvm && unset NVM_DIR
# For any further info about uninstllation please read the following:
# https://github.com/creationix/nvm#removal

# NVM change node version automatically whenever a .nvmrc file is found in a folder
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
####################################################################################

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias ohmyzsh="open ~/.oh-my-zsh"
# Shortcuts to config files
alias zshconfig="code ~/.zshrc"
alias gitconf="code ~/.gitconfig"
alias gitc="gitconf"
# Docker
alias dps="docker ps"
alias dstats="docker stats"
alias dpa="docker ps -a"
alias dimgs="docker images"
alias dcu="docker-compose up -d" #<input:containerid(s)>
alias dcdo="docker-compose down" #<input:containerid(s)>
alias dcstart="docker-compose start" #<input:containerid(s)>
alias dcrestart="docker-compose restart" #<input:containerid(s)>
alias dcst="docker-compose stop" #<input:containerid(s)>
alias dcps="docker-compose ps"
alias de="docker exec -ti" #<input:command>
alias dl="docker logs" # <input:"containerid -f">
# To clear logs see https://stackoverflow.com/questions/42510002/how-to-clear-the-logs-properly-for-a-docker-container
# gets related volume name
# Alternative to '$ docker volume inspect'
# further info at https://stackoverflow.com/questions/30133664/how-do-you-list-volumes-in-docker-containers
alias dinspv="docker inspect -f '{{ .Mounts }}'" #<input:containerid>
alias drm="docker rm" #<input:containerid>
alias dvrm="docker volume rm" #<input:volumeid>
# To cleanup your docker data pls see https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430
# Misc
alias ssshreload="sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist" 
alias lah="ls -lah"
alias sdnscc="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias space.="du -sh ."
alias space="du -sh"
alias stree="open -a SourceTree" # Usage: stree . 

# More aliases can be found following this link:
# https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html


# Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

# Android SDK
alias adb='~/Library/Android/sdk/platform-tools/adb'
export PATH="$ANDROID_SDK/emulator:$PATH"
export ANDROID_HOME=$ANDROID_SDK
export ANDROID_SDK_ROOT=$ANDROID_SDK
export ANDROID_AVD_HOME=~/.android/avd

# Add Visual Studio Code (code)
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
# this command lets you type '$ code <file>' to open it
alias c.="code ."

# icu4c
# If you need to have icu4c first in your PATH run:
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
#
# For compilers to find icu4c you may need to set:
# export LDFLAGS="-L/usr/local/opt/icu4c/lib"
# export CPPFLAGS="-I/usr/local/opt/icu4c/include"

# zlib
# For compilers to find zlib you may need to set:
#   export LDFLAGS="-L/usr/local/opt/zlib/lib"
#   export CPPFLAGS="-I/usr/local/opt/zlib/include"
#
# For pkg-config to find zlib you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# libffi
# For compilers to find libffi you may need to set:
#   export LDFLAGS="-L/usr/local/opt/libffi/lib"
#   export CPPFLAGS="-I/usr/local/opt/libffi/include"
#
# For pkg-config to find libffi you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# readline
# For compilers to find readline you may need to set:
#   export LDFLAGS="-L/usr/local/opt/readline/lib"
#   export CPPFLAGS="-I/usr/local/opt/readline/include"
#
# For pkg-config to find readline you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

# guile
# Guile libraries can now be installed here:
#     Source files: /usr/local/share/guile/site/3.0
#     Compiled files: /usr/local/lib/guile/3.0/site-ccache
#     Extensions: /usr/local/lib/guile/3.0/extensions
# 
# export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
# export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
# export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

# unbound
# To have launchd start unbound now and restart at startup:
#   $ sudo brew services start unbound

# gnutls
# If you are going to use the Guile bindings you will need to add the following
# to your .bashrc or equivalent in order for Guile to find the TLS certificates
# database:
#   export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/

# docker
# more info at https://docs.docker.com/docker-for-mac/#install-shell-completion 
# ********************** Run ONCE!!! **********************
# etc=/Applications/Docker.app/Contents/Resources/etc
# ln -s $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
# ln -s $etc/docker-machine.zsh-completion /usr/local/share/zsh/site-functions/_docker-machine
# ln -s $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose

# brew install wget
export PATH="/usr/local/opt/gettext/bin:$PATH"
# For compilers to find gettext you may need to set:
# export LDFLAGS="-L/usr/local/opt/gettext/lib"
# export CPPFLAGS="-I/usr/local/opt/gettext/include"

# VS Code install pylint
# To let scripts be available uncomment following line
export PATH=/Users/luca/Library/Python/3.8/bin:$PATH

source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.7.2

# Npm for Ruby
eval "$(rbenv init -)"
