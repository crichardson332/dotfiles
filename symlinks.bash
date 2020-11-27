DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ln -sfn "$DIR/.bashrc" "$HOME/.bashrc"
ln -sfn "$DIR/.bashrc_ssh" "$HOME/.bashrc_ssh"
ln -sfn "$DIR/.dircolors" "$HOME/.dircolors"
ln -sfn "$DIR/.fonts" "$HOME/.fonts"
ln -sfn "$DIR/.prompt.bash" "$HOME/.prompt.bash"
ln -sfn "$DIR/.vimrc" "$HOME/.vimrc"

# have to check if hard directories already exist, then remove them
if [ -d "$HOME/.config/git" ]
then
  trash "$HOME/.config/git"
fi
if [ -d "$HOME/.config/i3" ]
then
  trash "$HOME/.config/i3"
fi
if [ -d "$HOME/.config/nautilus" ]
then
  trash "$HOME/.config/nautilus"
fi
if [ -d "$HOME/.config/rofi" ]
then
  trash "$HOME/.config/rofi"
fi
if [ -d "$HOME/.config/terminator" ]
then
  trash "$HOME/.config/terminator"
fi

ln -sfn "$DIR/.config/git" "$HOME/.config/git"
ln -sfn "$DIR/.config/i3" "$HOME/.config/i3"
ln -sfn "$DIR/.config/nautilus" "$HOME/.config/nautilus"
ln -sfn "$DIR/.config/rofi" "$HOME/.config/rofi"
ln -sfn "$DIR/.config/terminator" "$HOME/.config/terminator"
