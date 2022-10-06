#!/usr/bin/env bash

# Initialises stack environment.
function init_stack_env() {
    local INSTALLER_HOME=${1}

    if [[ ! -d $HOME/.esdoc ]]; then
        mkdir $HOME/.esdoc
        if [[ -f $INSTALLER_HOME/templates/app_credentials.txt ]]; then
            cp $INSTALLER_HOME/templates/app_credentials.txt $HOME/.esdoc/credentials
        fi
        if [[ -f $INSTALLER_HOME/templates/app_environment.txt ]]; then
            cp $INSTALLER_HOME/templates/app_environment.txt $HOME/.esdoc/environment
        fi
        cat $INSTALLER_HOME/templates/bashrc.txt >> $HOME/.bashrc
    fi
}

# Initialise stack ops directories.
init_stack_ops_dirs()
{
    local TARGET_DIR_NAME=${1}
    
    if [[ ! -d /opt/$TARGET_DIR_NAME/ops ]]; then
        mkdir -p /opt/$TARGET_DIR_NAME/ops
        mkdir -p /opt/$TARGET_DIR_NAME/ops/config
        mkdir -p /opt/$TARGET_DIR_NAME/ops/daemon
        mkdir -p /opt/$TARGET_DIR_NAME/ops/logs
    fi
}

# Initialises stack repo.
function init_stack_repo() {
    local REPO=${1}

    if [[ ! -d /opt/$REPO ]]; then
        pushd /opt
        git clone -q https://github.com/ES-DOC/$REPO.git
        popd
    else
        pushd /opt/$REPO
        git pull -q
        popd
    fi
}
