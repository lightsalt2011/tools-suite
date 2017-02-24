#!/bin/bash
#vim
sudo apt install vim && sudo apt install exuberant-ctags &&
tar -xzvf vim_config.tar.gz
cp vim_config/vim_rc/.vim* ~/
tar -xzvf vim_config/vim_dir.tar.gz -C ./vim_config
cp -a vim_config/.vim ~/

ls



