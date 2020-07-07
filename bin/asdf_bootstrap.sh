# From https://asdf-vm.com
#
if [ ! -d "$HOME/.asdf" ] ; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6
  echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc\necho -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
fi

$HOME/.asdf/bin/asdf plugin-add python
$HOME/.asdf/bin/asdf install python 3.8.1
$HOME/.asdf/bin/asdf global python 3.8.1

