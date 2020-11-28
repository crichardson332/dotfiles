SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

LINKS=(
  .bashrc
  .bashrc_ssh
  .prompt.bash
  .vimrc
)

DIRS=(
  .dircolors
  .fonts
  .config/git
  .config/i3
  .config/rofi
  .config/terminator
)

for dir in "${DIRS[@]}"
do
  # remove physical directories since they cant be overwritten with links
  if [ -d "$HOME/$dir" ]
  then
    trash "$HOME/$dir"
  fi
  # add to list of links to be created
  LINKS+=($dir)
done

for link in "${LINKS[@]}"
do
  ln -sfn "$SCRIPTDIR/$link" "$HOME/$link"
done
