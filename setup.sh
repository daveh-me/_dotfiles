#!/bin/sh
source_dir="$HOME/.dotfiles"
target_dir="$HOME"
vim_bundle_dir="$source_dir/vim/bundle"
timestamp=`date +%Y%m%d%H%M%S`

cd $source_dir

# symlinks to $HOME
#for link_source in `cat link-sources.txt`
#do
#    target="$HOME/.$link_source"
#    if [ -f $target ] || [ -L $target ]
#    then
#        mv -v $target $target.$timestamp
#    fi
#    ln -sv $source_dir/$link_source $target
#done

# grab stuff from github
#rm -rf oh-my-zsh
#git clone https://github.com/robbyrussell/oh-my-zsh
# and the vim stuff too
cd $vim_bundle_dir
rm -rfv *
for git_source in $(cat $source_dir/github-sources.txt)
do
	#git clone $git_source
	dname=$(echo $git_source | cut -d / -f5 | cut -d . -f1)
	echo $dname
done
