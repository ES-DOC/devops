#!/usr/bin/env bash

# Initialises stack environment.
function init_stack_env() {
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
    local REPO=${1}
    
    if [[ ! -d $INSTALLER_TARGET_DIR/$REPO/ops ]]; then
        mkdir -p $INSTALLER_TARGET_DIR/$REPO/ops
        mkdir -p $INSTALLER_TARGET_DIR/$REPO/ops/config
        mkdir -p $INSTALLER_TARGET_DIR/$REPO/ops/daemon
        mkdir -p $INSTALLER_TARGET_DIR/$REPO/ops/logs
    fi
}

# Initialises stack repo.
function init_stack_repo() {
    local REPO=${1}

    if [[ ! -d $INSTALLER_TARGET_DIR/$REPO ]]; then
        pushd $INSTALLER_TARGET_DIR
        git clone -q https://github.com/ES-DOC/$REPO.git
        popd
    else
        pushd $INSTALLER_TARGET_DIR/$REPO
        git pull -q
        popd
    fi
}
