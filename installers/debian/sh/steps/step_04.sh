# Imports.
source $INSTALLER_HOME/sh/utils/constants.sh
source $INSTALLER_HOME/sh/utils/general.sh
source $INSTALLER_HOME/sh/utils/stack.sh

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

    log "... step 4.3: initialising ops directories"
    _install_ops_fsys

    log "... step 4.4: initialising ops configuration"
    _install_ops_config

    log "... step 4.5: initialising credentials"
    _init_credentials

    log "END step 4"
}

# Initialises application credentials.
function _init_credentials() {
    cat >> $HOME/.esdoc/credentials <<- EOM

# Errata database password.
export ERRATA_DB_PWD=$(openssl rand -hex 16)

# Document database password.
export DOCUMENTATION_DB_PWD=$(openssl rand -hex 16)

EOM
}

# Initialise ops directories.
_install_ops_config()
{
    if [[ ! -f /opt/esdoc-cdf2cim-ws/ops/config/ws.conf ]]; then
        cat $INSTALLER_HOME/templates/ws-app-cdf2cim.conf >> /opt/esdoc-cdf2cim-ws/ops/config/ws.conf
    fi
    if [[ ! -f /opt/esdoc-cdf2cim-ws/ops/config/supervisord.conf ]]; then
        cp $INSTALLER_HOME/templates/ws-supervisord-cdf2cim.conf /opt/esdoc-cdf2cim-ws/ops/config/supervisord.conf
    fi

    if [[ ! -f /opt/esdoc-documentation-ws/ops/config/ws.conf ]]; then
        cat $INSTALLER_HOME/templates/ws-app-documentation.conf >> /opt/esdoc-documentation-ws/ops/config/ws.conf
    fi
    if [[ ! -f /opt/esdoc-documentation-ws/ops/config/supervisord.conf ]]; then
        cp $INSTALLER_HOME/templates/ws-supervisord-documentation.conf /opt/esdoc-documentation-ws/ops/config/supervisord.conf
    fi

    if [[ ! -f /opt/esdoc-errata-ws/ops/config/ws.conf ]]; then
        cat $INSTALLER_HOME/templates/ws-app-errata.conf >> /opt/esdoc-errata-ws/ops/config/ws.conf
    fi
    if [[ ! -f /opt/esdoc-errata-ws/ops/config/supervisord.conf ]]; then
        cp $INSTALLER_HOME/templates/ws-supervisord-errata.conf /opt/esdoc-errata-ws/ops/config/supervisord.conf
    fi

    if [[ ! -f /opt/pyessv-ws/ops/config/ws.conf ]]; then
        cat $INSTALLER_HOME/templates/ws-app-pyessv.conf >> /opt/pyessv-ws/ops/config/ws.conf
    fi
    if [[ ! -f /opt/pyessv-ws/ops/config/supervisord.conf ]]; then
        cp $INSTALLER_HOME/templates/ws-supervisord-pyessv.conf /opt/pyessv-ws/ops/config/supervisord.conf
    fi
}

# Initialise ops directories.
_install_ops_fsys()
{
    init_stack_ops_dirs "esdoc-cdf2cim-ws"
    init_stack_ops_dirs "esdoc-documentation-ws"
    init_stack_ops_dirs "esdoc-errata-ws"
    init_stack_ops_dirs "pyessv-ws"
}

# Invoke entry point.
main
