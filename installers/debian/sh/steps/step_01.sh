# Imports.
source $INSTALLER_HOME/sh/utils/general.sh
source $INSTALLER_HOME/sh/utils/sys.sh

# Main entry point.
main()
{
    log "BEGIN step 1:"

    log "... step 1.1: initialising system"
    init_sys_libs

    log "... step 1.2: initialising services"
    init_sys_service_nginx
    init_sys_service_pgres

    log "... step 1.3: initialising permissions"
    init_sys_permissions

    log "END step 1"
}

# Invoke entry point.
main
