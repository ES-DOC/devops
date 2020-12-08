#!/usr/bin/env bash

#######################################
# Initialises system python.
# Globals:
#   HOME - current user's home directory.
#######################################
function _init_sys_python() {
    opal_log "initialising python + pyenv"

    curl https://pyenv.run | bash
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    pyenv update
    pyenv install $OPAL_PYTHON_3
    pyenv install $OPAL_PYTHON_2

    pyenv global $OPAL_PYTHON_3
    pip3 install --upgrade pip
    pip3 install --upgrade pipenv
    pip3 install --upgrade supervisor
}

#######################################
# Initialises system tmp directory.
# Globals:
#   HOME - current user's home directory.
#######################################
function _init_sys_tmp() {
    opal_log "initialising temporary directory"

    mkdir $HOME/tmp
    chmod a+x $HOME/tmp
    export TMPDIR=$HOME/tmp
}

#######################################
# Initialises system esdoc directory.
# Globals:
#   HOME - current user's home directory.
#   OPAL_HOME - opal bash home directory.
#######################################
function _init_sys_esdoc_environment() {
    opal_log "initialising environment vars"

    mkdir $HOME/.esdoc
    cp $OPAL_HOME/templates/redentials.txt $HOME/.esdoc/credentials
    cp $OPAL_HOME/templates/environment.txt $HOME/.esdoc/environment
}

#######################################
# Initialises system.
# Globals:
#   HOME - current user's home directory.
#######################################
function main () {
    if [[ ! -d $HOME/tmp ]]; then
        _init_sys_tmp
    fi
    if [[ ! -d $HOME/.pyenv ]]; then    
        _init_sys_python
    fi
    if [[ ! -d $HOME/.esdoc ]]; then
        _init_sys_esdoc_environment
    fi
}

# Invoke entry point.
main
