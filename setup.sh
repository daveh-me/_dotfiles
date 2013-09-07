#!/bin/sh
source_dir="$HOME/.dotfiles"
target_dir="$HOME"
timestamp=`date +%Y%m%d%H%M%S`

cd $source_dir

for link_source in `cat link-sources.txt`
do
    target="$HOME/.$link_source"
    if [ -f $target ] || [ -L $target ]
    then
        mv -v $target $target.$timestamp
    fi
    ln -sv $source_dir/$link_source $target
done

