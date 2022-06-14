# Main entry point.
main()
{
    installer_log "Initialisation begins ..."

    # Initialise machine in readiness for setup.
    source $INSTALLER_HOME/sh/init_sys.sh
    source $INSTALLER_HOME/sh/init_stack.sh
    source $INSTALLER_HOME/sh/init_nginx.sh
    source $INSTALLER_HOME/sh/init_pgres.sh

    installer_log "Initialisation ends"
}

# Invoke entry point.
main
