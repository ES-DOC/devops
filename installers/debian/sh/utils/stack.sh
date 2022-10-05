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
