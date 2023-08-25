export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eastwood"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
#COMPLETION_WAITING_DOTS="true"

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



# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# History configurations
#HISTFILE=~/.zsh_history
#HISTSIZE=1000
#SAVEHIST=2000
#setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
#setopt hist_ignore_dups       # ignore duplicated commands history list
#setopt hist_ignore_space      # ignore commands that start with space
#setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# force zsh to show the complete history
#alias history="history 0"

# Modal cursor color for vi's insert/normal modes.

zle-keymap-select () {
  if [ $KEYMAP = vicmd ]; then
    echo -ne "\033]12;Magenta\007"    # Change cursor color to Green
    echo -ne "\033[2 q"             # Change cursor to block
  else
    echo -ne "\033]12;White\007"    # Change cursor color to White
    echo -ne "\033[6 q"             # Change cursor to caret
  fi
}

zle -N zle-keymap-select

zle-line-init () {
  zle -K viins
  echo -ne "\033]12;White\007"      # Change cursor color to White
  echo -ne "\033[6 q"               # Change cursor to caret
}

zle -N zle-line-init

export EDITOR=nvim


# VIM
set -o vi
alias vim=nvim
bindkey -M vicmd '^R' history-incremental-search-backward
bindkey -M viins '^R' history-incremental-search-backward
export KEYTIMEOUT=1

# PLUGINS
plugins+=(git)
plugins+=(zsh-vi-mode)


# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# bare git dir alias
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no


# ADD ZSH-syntax PLUGIN (MUST BE LAST)
bindkey '^ ' autosuggest-accept
plugins+=(zsh-autosuggestions)

plugins+=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
bindkey '^ ' autosuggest-accept
set -o vi
bindkey -a -r ':'
