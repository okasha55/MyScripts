# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/okasha/.oh-my-zsh"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="tjkirch_mod"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
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
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  autojump
  urltools
  sudo
  command-not-found
)

source $ZSH/oh-my-zsh.sh

# User configuration

# ===== Basics
# setopt interactive_comments # Allow comments even in interactive shells (especially for Muness)



# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias pac='yay -S --needed --editmenu --nodiffmenu'   # install
alias pacu='yay -Syyu'    # update
alias pacr='yay -R'   # remove
alias pacrs='yay -Rs'   # remove with dependencies
alias pacrc='yay -Rsc'   # remove with dependents
alias pacs='yay -Ss'      # search
alias paci='yay -Si'      # info
alias paclo='yay -Qdt'    # list orphans
alias pacro='paclo && yay -Rns $(yay -Qtdq) && yay -Yc' # remove orphans
alias pacc='yay -Scc'    # clean cache
alias paclf='yay -Ql'   # list files
alias pacd='sudo pacman -D --asdeps' # mark as dependency
alias pacx='sudo pacman -D --asexplicit' # mark as explicit

alias wlcm='sh ~/Desktop/MyScripts/wlcm.sh'

export PATH="/home/okasha/.local/bin:$PATH"
export SUDO_PROMPT=$'\a[sudo] password for %p: '


#source ~/esp/esp-idf/export.sh
alias get_idf='. $HOME/esp/esp-idf/export.sh'

alias rflct='sudo reflector --age 24 --verbose --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias matlab='export MW_CUDA_FORWARD_COMPATIBILITY=1;export CUDA_CACHE_MAXSIZE=536870912;matlab -desktop'

alias BAKZSH='cp ~/.zshrc ~/Desktop/MyScripts/.zshrc'
alias BAKPAC='pacman -Qqe > ~/Desktop/MyScripts/pkglist.txt'
#anaconda 
alias conda_start='source ~/anaconda3/bin/activate' 


alias vivado=/opt/Xilinx/Vivado/2020.2/bin/vivado

alias mine='sudo nvidia-smi -pl 130 && nvidia-settings --assign GPUMemoryTransferRateOffsetAllPerformanceLevels=2200 && nvidia-settings --assign GPUGraphicsClockOffsetAllPerformanceLevels=-500 && miner --algo eth --server eu.ezil.me:5555 --user 0x859770487e79e58f65843D1bB61Dfa946A53bc67.zil19624eg5h30ecv8k3ksapsmp06mseh0gscaw9jk'

alias stop_mine='sudo nvidia-smi -pl 210 && nvidia-settings --assign GPUMemoryTransferRateOffsetAllPerformanceLevels=0 && nvidia-settings --assign GPUGraphicsClockOffsetAllPerformanceLevels=0'

if [[ -n $SSH_CONNECTION ]] ; then
    sudo pkill miner 
fi



function tf_jup(){
	docker run -u $(id -u):$(id -g) -v ~/$1:/tf/$1 --gpus all -p $2:$2 -it --rm tf-jupyter-gpu:latest bash -c "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --port $2"
}
function tf_shell(){
	docker run -v ~/$1:/tf/$1 --gpus all -p $2:$2 -it --rm tf-jupyter-gpu:latest bash -c "source /etc/bash.bashrc && bash" 
}


export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/okasha/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/okasha/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/okasha/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/okasha/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

