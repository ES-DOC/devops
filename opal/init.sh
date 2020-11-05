#!/usr/bin/env bash

#######################################
# Initialises system python.
# Globals:
#   HOME - current user's home directory.
#######################################
function _init_sys_python() {
    log "initialising python + pyenv"

    curl https://pyenv.run | bash
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    pyenv update
    pyenv install 3.9.0
    pyenv install 2.7.18

    pyenv global 3.9.0
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
    log "initialising temporary directory"

    mkdir $HOME/tmp
    chmod a+x $HOME/tmp
    export TMPDIR=$HOME/tmp
}

#######################################
# Initialises system tmp directory.
# Globals:
#   HOME - current user's home directory.
#######################################
function _init_esdoc_environment() {
    log "initialising environment vars"

    mkdir $HOME/.esdoc
    cp $OPAL_HOME/template_credentials.txt $HOME/.esdoc/credentials
    cp $OPAL_HOME/template_environment.txt $HOME/.esdoc/environment
}

#######################################
# Entry point: initialises system.
# Globals:
#   HOME - current user's home directory.
#######################################
if [[ ! -d $HOME/tmp ]]; then
    _init_sys_tmp
fi
if [[ ! -d $HOME/.pyenv ]]; then
    _init_sys_python
fi
if [[ ! -d $HOME/.esdoc ]]; then
    _init_esdoc_environment
fi
