#!/usr/bin/env bash

#######################################
# VARS.
#######################################

# Array of managed archives.
declare -a OPAL_ARCHIVES=(
	'esdoc-archive'
	'pyessv-archive'
	'esdoc-cdf2cim-archive'
)

# Array of local libraries.
declare -a OPAL_LIBS=(
    # ... web-services
    'esdoc-api'
    'esdoc-cdf2cim-ws'
    'esdoc-errata-ws'
	'pyessv-ws'

    # ... front-ends
    'esdoc-web-compare'
    'esdoc-web-explorer'
    'esdoc-web-search'
    'esdoc-web-view'
    'esdoc-web-view-specialization'
    'esdoc-errata-fe'

    # ... other
	'esdoc-py-client'
    'esdoc-web-static'
)

#######################################
# Syncs an archive repo.
# Arguments:
#   Archive repo name.
#######################################
function sync_archive() {
    sync_repo "archives" $1
}

#######################################
# Syncs set of archive repos.
#######################################
function sync_archives() {
    log "syncing archives:"

    if [[ ! -d $HOME/archives ]]; then
        mkdir $HOME/archives
    fi    
	for archive in "${OPAL_ARCHIVES[@]}"
	do
        sync_archive $archive
	done    
}

#######################################
# Syncs ES-DOC environment file.
# Globals:
#   HOME - current user's home directory.
#######################################
function sync_environment() {
    log "syncing environment"

    if [[ ! -d $HOME/.esdoc ]]; then
        mkdir $HOME/.esdoc
    fi
    cp $OPAL_HOME/template_environment.txt $HOME/.esdoc/environment
}

#######################################
# Syncs a local library repo.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Library repo name.
#######################################
function sync_lib() {
    sync_repo "libs" $1
}

#######################################
# Syncs set of local library repos.
#######################################
function sync_libs() {
    log "syncing libs:"

    if [[ ! -d $HOME/libs ]]; then
        mkdir $HOME/libs
    fi    
	for lib in "${OPAL_LIBS[@]}"
	do
        sync_lib $lib
	done    
}

#######################################
# Syncs a repo.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Repo type.
#   Repo name.
#######################################
function sync_repo() {
    if [[ -d $HOME/$1/$2 ]]; then
        pushd $HOME/$1/$2
        git pull > /dev/null 2>&1
    else
        pushd $HOME/$1
        git clone https://github.com/ES-DOC/$2.git > /dev/null 2>&1
    fi
    popd -1
}

#######################################
# Entry point.
#######################################
function sync_all() {
    sync_archives
    sync_environment
    sync_libs
}
