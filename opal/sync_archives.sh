#!/usr/bin/env bash
#
# Exposes functions for syncing local archives.
# Globals:
#   HOME - current user's home directory.

# Array of managed archives.
declare -a _ARCHIVES=(
	'esdoc-archive'
	'pyessv-archive'
	'cdf2cim-archive'
)

#######################################
# Syncs an archive repo.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Archive repo name.
#######################################
function sync_archive() {
    if [[ -d $HOME/archives/$1 ]]; then
        cd $HOME/archives/$1
        git pull
    else
        cd $HOME/archives
        git clone https://github.com/ES-DOC/$1.git
    fi
}

#######################################
# Syncs set of archive repos.
#######################################
function sync_archives() {
    if [[ ! -d $HOME/archives ]]; then
        mkdir $HOME/archives
    fi    
	for archive in "${_ARCHIVES[@]}"
	do
        sync_archive $archive
	done    
}
