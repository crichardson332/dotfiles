DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ln -sfn "$DIR/.bashrc" "$HOME/.bashrc"
ln -sfn "$DIR/.bashrc_ssh" "$HOME/.bashrc_ssh"
ln -sfn "$DIR/.dircolors" "$HOME/.dircolors"
ln -sfn "$DIR/.fonts" "$HOME/.fonts"
ln -sfn "$DIR/.prompt.bash" "$HOME/.prompt.bash"
ln -sfn "$DIR/.vimrc" "$HOME/.vimrc"

ln -sfn "$DIR/.config/git" "$HOME/.config/git"
ln -sfn "$DIR/.config/i3" "$HOME/.config/i3"
ln -sfn "$DIR/.config/nautilus" "$HOME/.config/nautilus"
ln -sfn "$DIR/.config/rofi" "$HOME/.config/rofi"
ln -sfn "$DIR/.config/terminator" "$HOME/.config/terminator"
