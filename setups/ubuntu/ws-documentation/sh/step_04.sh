# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_SHARED/sh/utils.sh

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

    log "END step 4"
}

# Initialises source code repos.
function _init_repos() {
	for REPO in "${INSTALLER_REPOS[@]}"
	do
        if [[ ! -d /opt/$REPO ]]; then
            pushd /opt    
            git clone -q https://github.com/ES-DOC/$REPO.git
            popd
        else
            pushd /opt/$REPO
            git pull -q
            popd
        fi
	done
}

# Initialises application environment files.
function _init_env() {
    if [[ ! -d $HOME/.esdoc ]]; then
        mkdir $HOME/.esdoc
        cp $INSTALLER_HOME/templates/app_credentials.txt $HOME/.esdoc/credentials
        cp $INSTALLER_HOME/templates/app_environment.txt $HOME/.esdoc/environment
        cat $INSTALLER_SHARED/templates/bashrc.txt >> $HOME/.bashrc
        cat >> $HOME/.esdoc/credentials <<- EOM

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
        cat $INSTALLER_HOME/templates/ws-app.conf >> /opt/esdoc-errata-ws/ops/config/ws.conf
    fi

    if [[ ! -f /opt/esdoc-errata-ws/ops/config/supervisord.conf ]]; then
        cp $INSTALLER_HOME/templates/ws-supervisord.conf /opt/esdoc-errata-ws/ops/config/supervisord.conf
    fi
}

# Invoke entry point.
main
