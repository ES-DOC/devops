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

    log "... step 4.3: initialising ops directories"
    _install_ops

    log "END step 4"
}

# Initialise ops directories.
_install_ops()
{
    if [[ ! -d /opt/esdoc-cdf2cim-ws/ops ]]; then
        mkdir -p /opt/esdoc-cdf2cim-ws/ops
        mkdir -p /opt/esdoc-cdf2cim-ws/ops/config
        mkdir -p /opt/esdoc-cdf2cim-ws/ops/daemon
        mkdir -p /opt/esdoc-cdf2cim-ws/ops/logs
    fi

    if [[ ! -f /opt/esdoc-cdf2cim-ws/ops/config/ws.conf ]]; then
        cat $INSTALLER_HOME/templates/ws-app.conf >> /opt/esdoc-cdf2cim-ws/ops/config/ws.conf
    fi

    if [[ ! -f /opt/esdoc-cdf2cim-ws/ops/config/supervisord.conf ]]; then
        cp $INSTALLER_HOME/templates/ws-supervisord.conf /opt/esdoc-cdf2cim-ws/ops/config/supervisord.conf
    fi
}

# Invoke entry point.
main
