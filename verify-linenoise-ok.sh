#!/bin/sh

set -e -x

tmux -V

export PATH=$PATH:/tmp/nom/bin:/tmp/nom/share/perl6/site/bin/

git clone https://github.com/rakudo/rakudo
git clone https://github.com/tadzik/panda

cd rakudo
perl Configure.pl --prefix=/tmp/nom --gen-moar && make install

cd ../panda
perl6 bootstrap.pl

panda install Linenoise

tmux -L non-default new-session -d -s perl6 perl6
tmux -L non-default send-keys s tab
tmux -L non-default capture-pane
tmux -L non-default save-buffer -b 0 /tmp/out
cat /tmp/out
grep -q samecase /tmp/out || (echo "tab completion seems to be broken" && false)
