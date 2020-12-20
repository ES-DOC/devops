#!/usr/bin/env bash

#######################################
# Initialises file sytstem.
# Globals:
#   HOME - current user's home directory.
#   OPAL_ARCHIVES - array of managed archives.
#   OPAL_LIBS - array of managed libraries.
#######################################
function init_fs() {
    if [[ ! -d $HOME/archives ]]; then
        mkdir $HOME/archives
    fi    
    if [[ ! -d $HOME/libs ]]; then
        mkdir $HOME/libs
    fi 
}

#######################################
# Initialises a repo.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Repo type.
#   Repo name.
#######################################
function init_repo() {
    local REPO_TYPE=${1}
    local REPO_NAME=${2}
    local REPO_DIR=$HOME/$REPO_TYPE/$REPO_NAME
    local REPO_URL=https://github.com/ES-DOC/$REPO_NAME.git

    if [[ ! -d $REPO_DIR ]]; then
        pushd $HOME/$REPO_TYPE
        git clone $REPO_URL > /dev/null 2>&1
        popd
    else
        pushd $REPO_DIR
        git pull
        popd
    fi
}

#######################################
# Initialises set of managed repo.
# Globals:
#   OPAL_ARCHIVES - array of managed archives.
#   OPAL_LIBS - array of managed libraries.
#######################################
function init_repos() {
    # Initialise archives.
	for TARGET in "${OPAL_ARCHIVES[@]}"
	do
        opal_log "... ... "$TARGET
        init_repo "archives" $TARGET
	done     

    # Initialise libraries.
	for TARGET in "${OPAL_LIBS[@]}"
	do
        opal_log "... ... "$TARGET
        init_repo "libs" $TARGET
	done 
}

#######################################
# Initialises a virtual environment.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Version of python to apply.
#   Name of library in which to create a venv.
#######################################
function init_venv() {
    local PYTHON_VERSION=${1}
    local LIB_NAME=${2}

    if [[ -d $HOME/libs/$LIB_NAME ]]; then
        echo "initialise $LIB_NAME :: $PYTHON_VERSION"
    fi

    # pushd $HOME/libs/esdoc-api
    # pyenv local $OPAL_PYTHON_2
    # popd    
}

#######################################
# Initialises virtual environments.
# Globals:
#   HOME - current user's home directory.
#   OPAL_ARCHIVES - array of managed archives.
#   OPAL_LIBS - array of managed libraries.
#######################################
function init_venvs() {
    init_venv $OPAL_PYTHON_2 esdoc-api
    init_venv $OPAL_PYTHON_3 esdoc-cdf2cim-ws
    init_venv $OPAL_PYTHON_2 esdoc-errata-ws
    init_venv $OPAL_PYTHON_3 pyessv-ws
    init_venv $OPAL_PYTHON_2 esdoc-py-client
}

#######################################
# Initialises stack.
# Globals:
#   HOME - current user's home directory.
#######################################
function main() {
    init_fs
    init_repos
    init_venvs
}

# Invoke entry point.
main
