# My Vimfiles

Use at your own risk ;).

## Installing

  // Grab the files
  git clone git://github.com/carlosantoniodasilva/vimfiles.git ~/.vim

  // Download plugins with git submodules
  cd ~/.vim
  git submodule update --init

  // Configure command-t (make sure you run this using the system ruby)
  // rbenv shell system # for rbenv users
  // rvm use system # for rvm users
  cd bundle/command-t/ruby/command-t/
  ruby extconf.rb
  make

  // Link config files
  ln -s ~/.vim/vimrc ~/.vimrc
  ln -s ~/.vim/gvimrc ~/.gvimrc
