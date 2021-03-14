#!/usr/bin/env bash

#######################################
# Initialises a virtual environment.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Version of python to apply.
#   Name of library in which to create a venv.
#######################################
function update_venv() {
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
        opal_log "... updated venv :: $LIB_NAME :: $PYTHON_VERSION"
    fi
}

#######################################
# Updates virtual environments.
# Globals:
#   HOME - current user's home directory.
#   OPAL_PYTHON_2 - python 2 version.
#   OPAL_PYTHON_3 - python 3 version.
#######################################
function main() {
    update_venv $OPAL_PYTHON_2 esdoc-api
    update_venv $OPAL_PYTHON_3 esdoc-cdf2cim-ws
    update_venv $OPAL_PYTHON_2 esdoc-errata-ws
    update_venv $OPAL_PYTHON_3 pyessv-ws
    update_venv $OPAL_PYTHON_2 esdoc-py-client
}

# Invoke entry point.
main
