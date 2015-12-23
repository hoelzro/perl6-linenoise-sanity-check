#!/bin/sh

set -e -x

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
tmux -L non-default capture-pane -p | grep -q samecase || (echo "tab completion seems to be broken" && false)
