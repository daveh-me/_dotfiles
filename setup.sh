#!/bin/sh
source_dir="$HOME/.dotfiles"
target_dir="$HOME"
vim_bundle_dir="$source_dir/vim/bundle"
timestamp=`date +%Y%m%d%H%M%S`

cd $source_dir

#for link_source in `cat link-sources.txt`
#do
#    target="$HOME/.$link_source"
#    if [ -f $target ] || [ -L $target ]
#    then
#        mv -v $target $target.$timestamp
#    fi
#    ln -sv $source_dir/$link_source $target
#done

git_sources=`cat github-sources.txt`
cd $vim_bundle_dir
rm -rfv *
for git_source in $git_sources
do
    git clone $git_source
done
