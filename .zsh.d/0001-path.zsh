export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export GOPATH=$HOME/go
export YARN_GLOBAL=$(yarn global bin)
export PATH=$HOME/.rbenv/bin:$GOPATH/bin:$YARN_GLOBAL:$PATH
export BROWSER="open"

# rbenv
eval "$(rbenv init -)"

# nvm
source $(brew --prefix nvm)/nvm.sh
