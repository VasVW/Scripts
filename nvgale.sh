#!/bin/bash
package_check() {
  package=$1
  if ! command -v $package &> /dev/null; then
    echo "$package not found. Installing"
    sudo apt install -y package
  else
    echo "package installed" 
  fi
  }

echo "installing nvgale"
wget -P ~/ https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz

if [ ! -f ~/nvim-linux64.tar.gz ]; then
  echo "Download Failed"
  exit 1
fi

tar -xzf ~/nvim-linux64.tar.gz 
echo "extracted "

mkdir -p ~/.local/bin
if [ -d ~/nvim-linux64 ]; then
  if [ -d ~/.local/nvim-linux64 ]; then
    rm -rf ~/.local/nvim-linux64
  fi
  mv ~/nvim-linux64 ~/.local/ 
else
  echo "no nvim found"
fi
ln -sf ~/.local/nvim-linux64/bin/nvim ~/.local/bin/nvim

#The if statements are just me training

if ! grep -Fxq 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi
source ~/.bashrc
rm -rf ~/nvim-linux64.tar.gz

package_check "git"
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
