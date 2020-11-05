#!/usr/bin/env bash
#
# Exposes functions for syncing applications.
# Globals:
#   HOME - current user's home directory.

#######################################
# Syncs an application.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Application opal name.
#   Application github repo.
#######################################
function sync_app() {
    if [[ -d $HOME/apps/$1 ]]; then
        cd $HOME/apps/$1
        git pull
    else
        cd $HOME/apps
        git clone https://github.com/ES-DOC/$2.git ./$1
        cd ./$1
    fi
}

#######################################
# Syncs set of applications.
#######################################
function sync_apps() {
    if [[ ! -d $HOME/apps ]]; then
        mkdir $HOME/apps
    fi    

    sync_app "test_ws_pyessv" "pyessv-ws"
}
