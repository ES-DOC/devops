#!/usr/bin/env bash
#
# Exposes functions for syncing local libraries.
# Globals:
#   HOME - current user's home directory.

# Array of local libraries.
declare -a _LIBS=(
	'esdoc-py-client'
)

#######################################
# Syncs a local library repo.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Library repo name.
#######################################
function sync_lib() {
    if [[ -d $HOME/libs/$1 ]]; then
        cd $HOME/libs/$1
        git pull
    else
        cd $HOME/libs
        git clone https://github.com/ES-DOC/$1.git
    fi
}

#######################################
# Syncs set of local library repos.
#######################################
function sync_libs() {
    if [[ ! -d $HOME/libs ]]; then
        mkdir $HOME/libs
    fi    
	for lib in "${_LIBS[@]}"
	do
        sync_lib $lib
	done    
}
