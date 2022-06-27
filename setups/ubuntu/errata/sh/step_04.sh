# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 4:"

    log "... step 4.1: initialising repos"
    _init_repos

    log "... step 4.2: initialising environment"
    _init_env

    log "... step 4.3: initialising ops directories"
    _install_ops

    log "... step 4.4: initialising python venv"
    _init_venv

    log "END step 4"
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
        cp $INSTALLER_HOME/templates/app_credentials.txt $HOME/.esdoc/credentials
        cp $INSTALLER_HOME/templates/app_environment.txt $HOME/.esdoc/environment
        cat $INSTALLER_HOME/templates/bashrc.txt >> $HOME/.bashrc
        cat >> $HOME/.esdoc/credentials.sh <<- EOM

# Errata database password.
export ERRATA_DB_PWD=$(openssl rand -hex 16)

EOM
    fi
}

# Initialise ops directories.
_install_ops()
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

# Initialise python virtual env.
_init_venv()
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
