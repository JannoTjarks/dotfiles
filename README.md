# My dot-files!
This repository stores my dot/hidden-files.
My daily driver is neovim as leightweidth texteditor with some plugins like nvim-lspconfig and nvim-cmp in a tmux session.
On my personal pc based on openSUSE Thumbleweed I am using alacritty as my default terminal. At work I need to use windows with windows terminal and Debian with WSL2.
At the moment there is no section for specific opensuse configuration, this will follow in future.

I'm a devops engineer, so I am heavily using community tools for terraform deployments and kubernetes management.

**Warning!** Dont use my dot-files or the following lines of code without a deep unterstanding and analyse.

## Software mentioned
### Core Tools
- zsh (with oh-my-zsh)
- tmux (with the dracula theme)
- neovim

### DevOps Tools
#### Terraform related tools
- terraform
- terraform-docs
- tflint
- tfsec

#### Kubernetes/Cloud-native related tools
- kubectl
- kubens
- kubectx
- kubelogin
- k9s

#### Other
- Azure CLI
- PowerShell (pwsh)
- dotnet SDK 6
- Node Version Manager (for web development and lsp support)
- ripgrep (for the Neovim plugin telescope)
- fd (for the Neovim plugin telescope)

## Specific debian/ubuntu configuration
``` sh
sudo apt update
sudo apt upgrade
sudo apt install -y zsh tmux curl unzip wget gpg lsb-release ca-certificates g++ gnupg apt-transport-https git telnet dnsutils wget
```

### Install Neovim
``` sh
NEOVIM_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/neovim/neovim/releases/latest)
NEOVIM_DOWNLOAD_URL=$(echo $NEOVIM_URL | sed 's/tag/download/')
curl --insecure -Lo nvim-latest-linux64.deb $NEOVIM_DOWNLOAD_URL/nvim-linux64.deb
sudo apt install ./nvim-latest-linux64.deb
rm ./nvim-latest-linux64.deb
```

### Install Terraform
``` sh
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

### Install dotnet sdk 6
``` sh
wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y dotnet-sdk-6.0
```


## Generic configuration
``` sh
mkdir $HOME/.local/bin -p
mkdir $HOME/.local/bin/complete -p
mkdir $HOME/documents/github -p
```

### Core tools
#### oh-my-zsh
``` sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/dracula/zsh.git $HOME/documents/github/dracula-zsh
ln -s $HOME/documents/github/dracula-zsh/dracula.zsh-theme $HOME/.oh-my-zsh/themes/dracula.zsh-theme
```

#### TMUX
``` sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

#### Neovim
``` sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### DevOps Tools
#### Kubernetes
##### Install Kubectl
``` sh
curl -Lo $HOME/.local/bin/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" --insecure
chmod 755 $HOME/.local/bin/kubectl
```

##### Install Kubelogin
``` sh
KUBELOGIN_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/Azure/kubelogin/releases/latest)
KUBELOGIN_DOCS_DOWNLOAD_URL=$(echo $KUBELOGIN_RELEASE_URL | sed 's/tag/download/')
curl --insecure -Lo kubelogin-linux-amd64.zip $KUBELOGIN_DOCS_DOWNLOAD_URL/kubelogin-linux-amd64.zip
unzip -j kubelogin-linux-amd64.zip -d $HOME/.local/bin
rm kubelogin-linux-amd64.zip
```

##### Install kubens and kubectx
``` sh
KUBECTX_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/ahmetb/kubectx/releases/latest)
KUBECTX_DOWNLOAD_URL=$(echo $KUBECTX_RELEASE_URL | sed 's/tag/download/')
KUBECTX_VERSION=$(echo $KUBECTX_DOWNLOAD_URL | cut -d'/' -f8)
curl --insecure -Lo kubectx_x86_64.tar.gz $KUBECTX_DOWNLOAD_URL/kubectx_$(echo $KUBECTX_VERSION)_linux_x86_64.tar.gz
curl --insecure -Lo kubens_x86_64.tar.gz $KUBECTX_DOWNLOAD_URL/kubens_$(echo $KUBECTX_VERSION)_linux_x86_64.tar.gz
tar --directory $HOME/.local/bin -xzf kubectx_x86_64.tar.gz kubectx
tar --directory $HOME/.local/bin -xzf kubens_x86_64.tar.gz kubens
rm kubectx_x86_64.tar.gz
rm kubens_x86_64.tar.gz
```

##### Install k9s
``` sh
KUBE9S_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/derailed/k9s/releases/latest)
KUBE9S_DOWNLOAD_URL=$(echo $KUBE9S_RELEASE_URL | sed 's/tag/download/')
curl --insecure -Lo k9s_x86_64.tar.gz $KUBE9S_DOWNLOAD_URL/k9s_Linux_x86_64.tar.gz
tar --directory $HOME/.local/bin -xzf k9s_x86_64.tar.gz k9s
rm k9s_x86_64.tar.gz
```

#### Terraform

##### Install terraform-docs
``` sh
TERRAFORM_DOCS_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/terraform-docs/terraform-docs/releases/latest)
TERRAFORM_DOCS_DOWNLOAD_URL=$(echo $TERRAFORM_DOCS_RELEASE_URL | sed 's/tag/download/')
TERRAFORM_DOCS_VERSION=$(echo $TERRAFORM_DOCS_DOWNLOAD_URL | cut -d'/' -f8)
curl --insecure -Lo terraform-docs-amd64.tar.gz $TERRAFORM_DOCS_DOWNLOAD_URL/terraform-docs-$TERRAFORM_DOCS_VERSION-linux-amd64.tar.gz
tar --directory $HOME/.local/bin -xzf terraform-docs-amd64.tar.gz terraform-docs
rm terraform-docs-amd64.tar.gz
```

##### Install tflint
``` sh
TFLINT_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/terraform-linters/tflint/releases/latest)
TFLINT_DOWNLOAD_URL=$(echo $TFLINT_RELEASE_URL | sed 's/tag/download/')
curl --insecure -Lo tflint-linux-amd64.zip $TFLINT_DOWNLOAD_URL/tflint_linux_amd64.zip
unzip -j tflint-linux-amd64.zip -d $HOME/.local/bin
rm tflint-linux-amd64.zip
```

##### Install tfsec
``` sh
TFSEC_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/aquasecurity/tfsec/releases/latest)
TFSEC_DOWNLOAD_URL=$(echo $TFSEC_RELEASE_URL | sed 's/tag/download/')
TFSEC_VERSION=$(echo $TFSEC_DOWNLOAD_URL | cut -d'/' -f8)
curl --insecure -Lo tfsec_linux_amd64.tar.gz $TFSEC_DOWNLOAD_URL/tfsec_$(echo $TFSEC_VERSION | sed s/v//)_linux_amd64.tar.gz
tar --directory $HOME/.local/bin -xzf tfsec_linux_amd64.tar.gz tfsec
rm tfsec_linux_amd64.tar.gz
```

#### Microsoft
##### Azure CLI
``` sh
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt-get update
sudo apt-get install -y azure-cli
```

##### PowerShell (pwsh)
``` sh
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'
sudo apt update && sudo apt install -y powershell
```

## Dotfiles
``` sh
git clone https://github.com/JannoTjarks/dot-files.git $HOME/documents/github/dot-files
mkdir $HOME/.config/nvim -p
cp documents/github/dot-files/.zshrc $HOME
cp documents/github/dot-files/.tmux.conf $HOME
cp documents/github/dot-files/.config/nvim $HOME/.config/ -R
```

## Neovim configuration
### Third-party software for Neovim plugins
#### ripgrep
``` sh
RIPGREP_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/BurntSushi/ripgrep/releases/latest)
RIPGREP_DOWNLOAD_URL=$(echo $RIPGREP_RELEASE_URL | sed 's/tag/download/')
RIPGREP_VERSION=$(echo $RIPGREP_DOWNLOAD_URL | cut -d'/' -f8)
curl --insecure -Lo ripgrep_linux_x86_64.tar.gz $RIPGREP_DOWNLOAD_URL/ripgrep-$RIPGREP_VERSION-x86_64-unknown-linux-musl.tar.gz
tar -xzf ripgrep_linux_x86_64.tar.gz
cp ripgrep-$RIPGREP_VERSION-x86_64-unknown-linux-musl/rg $HOME/.local/bin
cp ripgrep-$RIPGREP_VERSION-x86_64-unknown-linux-musl/complete/_rg $HOME/.local/bin/complete
rm ripgrep_linux_x86_64.tar.gz
rm -Rf ripgrep-$RIPGREP_VERSION-x86_64-unknown-linux-musl
```

#### fd
``` sh
FD_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/sharkdp/fd/releases/latest)
FD_DOWNLOAD_URL=$(echo $FD_RELEASE_URL | sed 's/tag/download/')
FD_VERSION=$(echo $FD_DOWNLOAD_URL | cut -d'/' -f8)
curl --insecure -Lo fd_linux_x86_64.tar.gz $FD_DOWNLOAD_URL/fd-$FD_VERSION-x86_64-unknown-linux-musl.tar.gz
tar -xzf fd_linux_x86_64.tar.gz
cp fd-$FD_VERSION-x86_64-unknown-linux-musl/fd $HOME/.local/bin
cp fd-$FD_VERSION-x86_64-unknown-linux-musl/autocomplete/_fd $HOME/.local/bin/complete
rm fd_linux_x86_64.tar.gz
rm -Rf fd-$FD_VERSION-x86_64-unknown-linux-musl
```

### Neovim Language Server
#### nvm (Node Version Manager)
``` sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
# Restart terminal
nvm install --lts
```

#### npm-distributed language server
``` sh
npm install --global typescript-language-server
npm install --global yaml-language-server
npm install --global vscode-langservers-extracted
npm install --global bash-language-server
```

#### hashicorp/terraform-ls
``` sh
TERRAFORM_LS_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/hashicorp/terraform-ls/releases/latest)
TERRAFORM_LS_DOWNLOAD_URL=$(echo $TERRAFORM_LS_RELEASE_URL | sed 's/tag/download/')
TERRAFORM_LS_VERSION=$(echo $TERRAFORM_LS_DOWNLOAD_URL | cut -d'/' -f8)
curl --insecure -Lo terraform-ls-linux-amd64.zip $TERRAFORM_LS_DOWNLOAD_URL/terraform-ls_$(echo $TERRAFORM_LS_VERSION | sed s/v//)_linux_amd64.zip
unzip -j terraform-ls-linux-amd64.zip -d $HOME/.local/bin
rm terraform-ls-linux-amd64.zip
```

#### sumneko/lua-language-server
``` sh
LUA_LSP_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/sumneko/lua-language-server/releases/latest)
LUA_LSP_DOWNLOAD_URL=$(echo $LUA_LSP_RELEASE_URL | sed 's/tag/download/')
LUA_LSP_VERSION=$(echo $LUA_LSP_DOWNLOAD_URL | cut -d'/' -f8)
curl --insecure -Lo lua-language-server-linux-x64.tar.gz $LUA_LSP_DOWNLOAD_URL/lua-language-server-$LUA_LSP_VERSION-linux-x64.tar.gz
mkdir -p $HOME/.local/bin/lua-language-server
tar --directory $HOME/.local/bin/lua-language-server -xzf lua-language-server-linux-x64.tar.gz 
rm lua-language-server-linux-x64.tar.gz
```

#### PowerShell/PowerShellEditorServices
``` sh
mkdir $HOME/.local/bin/powershell-editor-services
POWERSHELL_ES_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/PowerShell/PowerShellEditorServices/releases/latest)
POWERSHELL_ES_DOWNLOAD_URL=$(echo $POWERSHELL_ES_RELEASE_URL | sed 's/tag/download/')
curl --insecure -Lo PowerShellEditorServices.zip $POWERSHELL_ES_DOWNLOAD_URL/PowerShellEditorServices.zip
unzip PowerShellEditorServices.zip -d $HOME/.local/bin/powershell-editor-services
rm PowerShellEditorServices.zip
```

#### OmniSharp/omnisharp-roslyn
``` sh
mkdir $HOME/.local/bin/omnisharp
OMNISHARP_RELEASE_URL=$(curl -Ls --insecure -o /dev/null -w %{url_effective} https://github.com/OmniSharp/omnisharp-roslyn/releases/latest)
OMNISHARP_DOWNLOAD_URL=$(echo $OMNISHARP_RELEASE_URL | sed 's/tag/download/')
curl --insecure -Lo omnisharp-linux-x64-net6.0.tar.gz $OMNISHARP_DOWNLOAD_URL/omnisharp-linux-x64-net6.0.tar.gz
tar --directory $HOME/.local/bin/omnisharp -xzf omnisharp-linux-x64-net6.0.tar.gz 
rm omnisharp-linux-x64-net6.0.tar.gz
```
