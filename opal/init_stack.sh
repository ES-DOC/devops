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
    if [[ ! -d $HOME/rewriters ]]; then
        mkdir $HOME/rewriters
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
# Initialises set of managed archives.
# Globals:
#   OPAL_ARCHIVES - array of managed archives.
#######################################
function init_archives() {
	for TARGET in "${OPAL_ARCHIVES[@]}"
	do
        opal_log "... ... "$TARGET
        init_repo "archives" $TARGET
	done     
}

#######################################
# Initialises set of managed libraries.
# Globals:
#   OPAL_LIBS - array of managed libraries.
#######################################
function init_libs() {
	for TARGET in "${OPAL_LIBS[@]}"
	do
        opal_log "... ... "$TARGET
        init_repo "libs" $TARGET
	done 
}

#######################################
# Initialises set of URL rewriters.
# Globals:
#   HOME - OS user home directory.
#######################################
function init_rewriters() {
	for REWRITER in "${OPAL_REWRITERS[@]}"
	do
        local REWRITER_DIR=$HOME/rewriters/$REWRITER
        if [[ ! -d $REWRITER_DIR ]]; then
            pushd $HOME/rewriters
            git clone https://github.com/ES-DOC/esdoc-ws-url-rewriter.git ./$REWRITER
        else
            pushd $REWRITER_DIR
            git pull
        fi        
        popd
	done

	for REWRITER in "${OPAL_REWRITERS[@]}"
	do
        local REWRITER_DIR=$HOME/rewriters/$REWRITER
        pushd $REWRITER_DIR
        pyenv local $OPAL_PYTHON_2
        popd
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
        pushd $HOME/libs/$LIB_NAME
        pyenv local $PYTHON_VERSION
        pip install --upgrade pip
        pip install --upgrade pipenv
        pipenv --rm        
        pipenv --python $PYTHON_VERSION
        rm ./Pipfile.lock
        pipenv install
        popd
        opal_log "... initialised venv :: $LIB_NAME :: $PYTHON_VERSION"
    fi
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
    init_archives
    init_libs
    init_rewriters
    init_venvs
}

# Invoke entry point.
main
