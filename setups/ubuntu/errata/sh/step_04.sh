# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 4:"

    log "... step 4.1: initialising bashrc"
    _init_bashrc

    log "... step 4.2: initialising repos"
    _init_repos

    log "... step 4.3: initialising environment"
    _init_env

    log "... step 4.4: initialising ops directories"
    _install_ops_dirs

    log "... step 4.5: initialising python venv"
    _init_python_venv

    log "END step 4"
}

# Initialises bashrc file.
function _init_bashrc() {
    if [[ ! -d /opt/pyessv-archive ]]; then
        cat $INSTALLER_HOME/templates/shell-pyessv.txt >> $HOME/.bashrc
    fi

    if [[ ! -d /opt/esdoc-errata-ws ]]; then
        cat $INSTALLER_HOME/templates/shell-postgresql.txt >> $HOME/.bashrc
        cat $INSTALLER_HOME/templates/shell-pythonpath.txt >> $HOME/.bashrc
        cat $INSTALLER_HOME/templates/shell-app.txt >> $HOME/.bashrc
    fi
}

# Initialises source code repos.
function _init_repos() {
    if [[ ! -d /opt/pyessv-archive ]]; then
        pushd /opt    
        git clone -q https://github.com/ES-DOC/pyessv-archive.git
        popd
    else
        pushd /opt/pyessv-archive
        git pull -q
        popd
    fi

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

# Initialise ops directories.
_install_ops_dirs()
{
    if [[ ! -d /opt/esdoc-errata-ws/ops ]]; then
        mkdir -p /opt/esdoc-errata-ws/ops
        mkdir -p /opt/esdoc-errata-ws/ops/config
        mkdir -p /opt/esdoc-errata-ws/ops/daemon
        mkdir -p /opt/esdoc-errata-ws/ops/logs
    fi

    if [[ ! -f /opt/esdoc-errata-ws/ops/config/ws.conf ]]; then
        cp $INSTALLER_HOME/templates/ws-app.conf /opt/esdoc-errata-ws/ops/config/ws.conf
    fi

    if [[ ! -f /opt/esdoc-errata-ws/ops/config/supervisord.conf ]]; then
        cp $INSTALLER_HOME/templates/ws-supervisord.conf /opt/esdoc-errata-ws/ops/config/supervisord.conf
    fi
}

# Initialise python virtual environment.
_init_python_venv()
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
