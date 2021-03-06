# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Toggle the theme based on local or remote usage
if [[ -n $SSH_CONNECTION ]]; then
  ZSH_THEME="spaceship"
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
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
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
zsh-autosuggestions     # --
zsh-completions         # | https://www.tronyxworld.be/2020/zsh_omz_p10k/
zsh-syntax-highlighting # --
encode64
tmux                    # For 'ZSH_TMUX_AUTOSTART="true"'
jump
colored-man-pages
virtualenv              # For displaying the current py venv
)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom
# Change autosuggestion color 
# didnt fit very well with Nord Theme of
# Gnome Termianl and Tmux
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=250'

# launch tmux at startup of ohmyz.sh 
ZSH_TMUX_AUTOSTART="true"

# Add this to $PATH for ...
export PATH=$PATH:/home/$USER/.local/bin # pwntools
export PATH=$PATH:/usr/local/go/bin # go
export PATH=$PATH:/home/$USER/go/bin
export PATH=$PATH:/opt/bitwarden # bitwarden cli
export PATH=$PATH:/opt/ImHex/bin # ImHex Hex Editor

## enable advanced calculation in bc by default
alias bc='bc -l'

## xclip command
alias setclip='xclip -selection c'
alias getclip='xclip -selection c -o'

## share command
alias termbin='nc termbin.com 9999'

## netstat command
alias ports='sudo netstat -tulanp | grep LISTENING'

## ip command
alias ip='ip -color'
alias ipb='ip -color -brief'

## gh cli autocompletion
if [[ ! -d "$ZSH/completions" || ! -f "$ZSH/completions/_gh" ]]; then
	mkdir -pv $ZSH/completions
	gh completion --shell zsh > $ZSH/completions/_gh
	echo "gh added completions: gh completion --shell zsh > $ZSH/completions/_gh"
fi

## update command
alias update='sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y'

alias update-pip3='pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'

alias '?'='echo $?'

## Add nord-dircolors
# https://github.com/arcticicestudio/nord-dircolors
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

if [[ hostname == 'MorpheusH3x-Laptop'  ]]
then
        alias luminosity='xrandr --output eDP-1 --brightness'
        alias python='python3.8'
        
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"

        export GO111MODULE=on
fi


if [[ hostname == 'RPI' ]]
then
        alias temp="exec argonone-tempmon 2>&1 | grep -E \\'[0-9]{5}'"
fi

# Keep it at the EOF
source $ZSH/oh-my-zsh.sh
