# Debian
PKGS=(
  build-essential
  curl
  cmake
  ctags
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
