#!/usr/bin/env bash

#######################################
# VARS.
#######################################

# Array of managed archives.
declare -a _ARCHIVES=(
	'esdoc-archive'
	'pyessv-archive'
	'esdoc-cdf2cim-archive'
)

# Array of local libraries.
declare -a _LIBS=(
	'esdoc-py-client'
)

#######################################
# Syncs an application.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Application opal name.
#   Application github repo.
#######################################
function sync_app() {
    log "    "$1

    if [[ -d $HOME/apps/$1 ]]; then
        cd $HOME/apps/$1
        git pull > /dev/null 2>&1
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
    log "syncing apps ..."

    if [[ ! -d $HOME/apps ]]; then
        mkdir $HOME/apps
    fi    

    sync_app "test_ws_pyessv" "pyessv-ws"
}

#######################################
# Syncs an archive repo.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Archive repo name.
#######################################
function sync_archive() {
    log "    "$1

    if [[ -d $HOME/archives/$1 ]]; then
        cd $HOME/archives/$1
        git pull > /dev/null 2>&1
    else
        cd $HOME/archives
        git clone https://github.com/ES-DOC/$1.git
    fi
}

#######################################
# Syncs set of archive repos.
#######################################
function sync_archives() {
    log "syncing archives"

    if [[ ! -d $HOME/archives ]]; then
        mkdir $HOME/archives
    fi    
	for archive in "${_ARCHIVES[@]}"
	do
        sync_archive $archive
	done    
}

#######################################
# Syncs a local library repo.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Library repo name.
#######################################
function sync_lib() {
    log "    "$1

    if [[ -d $HOME/libs/$1 ]]; then
        cd $HOME/libs/$1
        git pull  > /dev/null 2>&1
    else
        cd $HOME/libs
        git clone https://github.com/ES-DOC/$1.git
    fi
}

#######################################
# Syncs set of local library repos.
#######################################
function sync_libs() {
    log "syncing libs"

    if [[ ! -d $HOME/libs ]]; then
        mkdir $HOME/libs
    fi    
	for lib in "${_LIBS[@]}"
	do
        sync_lib $lib
	done    
}

#######################################
# Entry point.
#######################################
sync_apps
sync_archives
sync_libs
