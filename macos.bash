# install command line utils, homebrew, and python
xcode-select --install

if ! command -v brew &> /dev/null; then
    # Install Homebrew
    echo "Installing Homebrew."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# HOMEBREW_NO_AUTO_UPDATE=1 brew install gtest git python python3 vim safe-rm tmux grep coreutils trash ninja tree clang-format gnu-sed ctags --with-default-names
brew install gtest git python python3 vim safe-rm tmux grep coreutils trash ninja tree clang-format gnu-sed ctags
ln -s ".bashrc" "$HOME/.bash_profile"
