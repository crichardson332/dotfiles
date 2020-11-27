# Debian
PKGS=(
  build-essential
  ccache
  cmake
  ctags
  curl
  git
  gcc
  htop
  i3
  libgtest-dev
  ninja-build
  nitrogen
  numlockx
  openssh-server
  python
  python3
  python3-pip
  rofi
  safe-rm
  scrot
  vim
  tmux
  trash-cli
  tree
  terminator
  unzip
  xbacklight
  xclip
  xdotool
  xkbset
)

pkglist=''
for pkg in "${PKGS[@]}"
do
   pkglist+=" $pkg"
done

sudo apt-get update
sudo apt-get install -y $pkglist

# remap caps lock to ctrl
# /usr/bin/setxkbmap -option caps:ctrl_modifier
xset r rate 250 40
