# Dotfiles for Linux and MacOS

*Preferred dotfile configurations for common Unix software*

## Dependencies

Installation requires the following packages
* neovim: [https://github.com/neovim/neovim/wiki/Installing-Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
* vimplug: [https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)
* coreutils: [https://formulae.brew.sh/formula/coreutils](https://formulae.brew.sh/formula/coreutils)

## Installation

```
git clone https://github.com/morelandjs/dotfiles ~/.dotfiles
cd .dotfiles && ./make-symlinks
```

Note: if the dotfiles to be created already exist, it will throw a copy
error which can be addressed by deleting the existing file.
