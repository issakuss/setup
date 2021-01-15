brew install --HEAD neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

svn export https://github.com/issakuss/setup/branches/master/neovim/dotfiles
mkdir -p ~/dotfiles
cp -r dotfiles/ ~/dotfiles/
rm -rf dotfiles
mkdir -p ~/.config/nvim
ln -fs ~/dotfiles/init.vim ~/.config/nvim/init.vim