#!/bin/bash

# Check if Homebrew is installed, install it if not
if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
brew update

# Check if git is installed, install it if not
if test ! $(which git); then
    brew install git
fi

# Check if zsh is installed, install it if not
if test ! $(which zsh); then
    brew install zsh
fi

# Check if oh-my-zsh is installed, install it if not
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Check if powerlevel9k is installed, install it if not
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel9k" ]; then
    git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel9k
fi

# Check if nvm is installed, install it if not
# if [ ! -d "$HOME/.nvm" ]; then
#     curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
# fi

# Check if rvm is installed, install it if not
# if ! rvm > /dev/null 2>&1; then
#     \curl -sSL https://get.rvm.io | bash -s stable
#     source $HOME/.rvm/scripts/rvm
# fi

# Copy the zshrc file from your github
curl -o ~/.zshrc https://raw.githubusercontent.com/dswilson4/dev-setup/main/.zshrc

# Switch to zsh
chsh -s $(which zsh)

# Done
echo "Done, please open a new terminal, or run '. ~/.zshrc'"
