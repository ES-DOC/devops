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
    # Web-services.
    'esdoc-api'
    'esdoc-cdf2cim-ws'
    'esdoc-errata-ws'
	'pyessv-ws'
    # Front-ends.
    'esdoc-web-compare'
    'esdoc-web-explorer'
    'esdoc-web-search'
    'esdoc-web-view'
    'esdoc-web-view-specialization'
    'esdoc-errata-fe'
    # Other.
	'esdoc-py-client'
    'esdoc-web-static'
)

#######################################
# Syncs an archive repo.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Archive repo name.
#######################################
function sync_archive() {
    log "... "$1

    if [[ -d $HOME/archives/$1 ]]; then
        pushd $HOME/archives/$1
        git pull > /dev/null 2>&1
    else
        pushd $HOME/archives
        git clone https://github.com/ES-DOC/$1.git > /dev/null 2>&1
    fi
    popd -1
}

#######################################
# Syncs set of archive repos.
#######################################
function sync_archives() {
    log "syncing archives:"

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
    log "... "$1

    if [[ -d $HOME/libs/$1 ]]; then
        pushd $HOME/libs/$1
        git pull > /dev/null 2>&1
    else
        pushd $HOME/libs
        git clone https://github.com/ES-DOC/$1.git > /dev/null 2>&1
    fi
    popd -1
}

#######################################
# Syncs set of local library repos.
#######################################
function sync_libs() {
    log "syncing libs:"

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
sync_archives
sync_libs
