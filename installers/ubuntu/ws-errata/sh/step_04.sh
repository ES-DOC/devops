# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_SHARED/sh/init_stack.sh
source $INSTALLER_SHARED/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 4:"

    log "... step 4.1: initialising repos"
	for REPO in "${INSTALLER_REPOS[@]}"
	do
        init_stack_repo $REPO
	done

    log "... step 4.2: initialising environment"
    init_stack_env $INSTALLER_HOME

    log "... step 4.3: initialising credentials"
    _init_credentials

    log "... step 4.4: initialising ops directories"
    _install_ops

    log "END step 4"
}

# Initialises application credentials.
function _init_credentials() {
    cat >> $HOME/.esdoc/credentials <<- EOM

# Errata database password.
export ERRATA_DB_PWD=$(openssl rand -hex 16)

EOM
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
