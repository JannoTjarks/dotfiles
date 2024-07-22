# Environment variables
export PATH=/usr/bin/terraform:$HOME/go/bin/:$HOME/bin:$HOME/.local/bin:/usr/local/go/bin/:$PATH
export PATH=$HOME/.local/share/nvim/mason/bin/:$PATH

# Debian
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
export SSL_CERT_DIR=/etc/ssl/certs/
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export NODE_EXTRA_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# SUSE
# export SSL_CERT_FILE=/etc/ssl/ca-bundle.pem
# export SSL_CERT_DIR=/etc/ssl/ca-bundle.pem
# export CURL_CA_BUNDLE=/etc/ssl/ca-bundle.pem
# export REQUESTS_CA_BUNDLE=/etc/ssl/ca-bundle.pem
# export NODE_EXTRA_CA_BUNDLE=/etc/ssl/ca-bundle.pem


# Alias
alias currentfolder='basename "`pwd`"'

# Theme
export COLORTHEME="truecolor"
ZSH_THEME="catppuccin"
CATPPUCCIN_FLAVOR="mocha"
CATPPUCCIN_SHOW_TIME=true

# OH_MY_ZSH configuration
export ZSH=$HOME/.oh-my-zsh
plugins=(git web-search tmux)

ZSH_TMUX_AUTOSTART=true
ZSH_WEB_SEARCH_ENGINES=(reddit "https://www.reddit.com/search/?q=")

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# Completion
if (( $+commands[az] )); then
    source /etc/bash_completion.d/azure-cli &> /dev/null
fi
if (( $+commands[helm] )); then
    source <(helm completion zsh &> /dev/null)
fi
# '--kubeconfig /dev/null' is used to ignore special config, e.g. kubelogin
if (( $+commands[kubectl] )); then
    source <(kubectl --kubeconfig /dev/null completion zsh)
fi

# On rancher desktop based environment the error redirection is needed,
# because nerdctl is just a uncompleted link without rancher desktop
if (( $+commands[nerdctl] )); then
    source <(nerdctl completion zsh &> /dev/null) 
fi

# Sets nvim as default editor if installed
if (( $+commands[nvim] )); then
    export EDITOR=nvim
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
