# Main entry point.
main()
{
    installer_log "BEGIN initialisation:"

    installer_log "... step 01: initialising system"
    source $INSTALLER_HOME/sh/init_step_01.sh

    installer_log "... step 02: initialising application stack"
    source $INSTALLER_HOME/sh/init_step_02.sh

    installer_log "... step 03: initialising postgres"
    source $INSTALLER_HOME/sh/init_step_03.sh

    installer_log "... step 04: initialising nginx"
    source $INSTALLER_HOME/sh/init_step_04.sh

    installer_log "END initialisation:"
}

# Invoke entry point.
main
