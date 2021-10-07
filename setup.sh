#!/bin/zsh
DOTPATH=~/.dotfiles-m1-mac
GITHUB_URL="http://github.com/kajirikajiri/dotfiles-m1-mac.git"
TARBALL="https://github.com/kajirikajiri/dotfiles-m1-mac/archive/main.tar.gz"

# is_exists returns true if executable $1 exists in $PATH
is_exists() {
    type "$1" >/dev/null 2>&1
    return $?
}

# has is wrapper function
has() {
    is_exists "$@"
}

# die returns exit code error and echo error message
die() {
    e_error "$1" 1>&2
    exit "${2:-1}"
}

git clone --recursive "$GITHUB_URL" "$DOTPATH"

cd "$DOTPATH"
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi

# 移動できたらリンクを実行する
for f in .??*
do
    [ "$f" = ".git" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done

brew install zsh vim ghq fzf gh yarn tig nvm rbenv zsh-autosuggestions zplug

# setup node
nvm install node
nvm use node

# install commitizen, commitizen-emoji
npm install -g commitizen
npm install -g cz-emoji

# vim-plugをインストールする
if has "curl"; then
    echo 'install vim-plug'
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
    echo 'curl not found'
fi

