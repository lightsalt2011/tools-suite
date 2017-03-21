#!/bin/bash
#vim
cp bash_profile ~/.bash_profile

sudo apt-get install vim && sudo apt-get install exuberant-ctags &&
tar -xzvf vim_config.tar.gz
cp vim_config/vim_rc/.vim* ~/
tar -xzvf vim_config/vim_dir.tar.gz -C ./vim_config
cp -a vim_config/.vim ~/

ls



