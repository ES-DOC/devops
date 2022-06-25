# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 3:"

    log "... step 3.1: initialising repos"
    _init_repos

    log "... step 3.2: initialising environment"
    _init_env

    log "... step 3.3: initialising python venv"
    _init_python_env

    log "END step 2"
}

# Initialises source code repos.
function _init_repos() {
    if [[ ! -d /opt/esdoc-errata-fe ]]; then
        pushd /opt
        git clone -q https://github.com/ES-DOC/esdoc-errata-fe.git
        popd
    else
        pushd /opt/esdoc-errata-fe
        git pull -q
        popd
    fi

    if [[ ! -d /opt/esdoc-errata-ws ]]; then
        pushd /opt    
        git clone -q https://github.com/ES-DOC/esdoc-errata-ws.git
        popd
        cat $INSTALLER_HOME/templates/pythonpath.txt >> $HOME/.bashrc
        cat $INSTALLER_HOME/templates/shell-errata.txt >> $HOME/.bashrc
    else
        pushd /opt/esdoc-errata-ws
        git pull -q
        popd
    fi
}

# Initialises application environment files.
function _init_env() {
    if [[ ! -d $HOME/.esdoc ]]; then
        mkdir $HOME/.esdoc
    fi

    if [[ ! -f $HOME/.esdoc/credentials.sh ]]; then
        cp $INSTALLER_HOME/templates/credentials.txt $HOME/.esdoc/credentials.sh
    fi

    if [[ ! -f $HOME/.esdoc/environment.sh ]]; then
        cp $INSTALLER_HOME/templates/environment.txt $HOME/.esdoc/environment.sh
    fi
}

# Initialise python environment.
_init_python_env()
{
    pushd /opt/esdoc-errata-ws
    pyenv local --unset
    pyenv local $INSTALLER_PYTHON_2
    pip install pipenv
    pipenv run pipenv install
    popd
}

# Invoke entry point.
main
