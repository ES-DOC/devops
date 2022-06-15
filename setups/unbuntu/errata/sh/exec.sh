# Main entry point.
main()
{
    _exec_initialisation
    _exec_setup
}

_exec_initialisation()
{
    installer_log "BEGIN initialisation:"

    installer_log "... step 01: initialising system"
    source $INSTALLER_HOME/sh/init_step_01.sh

    installer_log "... step 02: initialising services"
    source $INSTALLER_HOME/sh/init_step_02.sh

    installer_log "... step 03: initialising application stack"
    source $INSTALLER_HOME/sh/init_step_03.sh

    installer_log "END initialisation" 
}

_exec_setup()
{
    installer_log "BEGIN setup:"

    installer_log "... step 01: setting up postgres"
    source $INSTALLER_HOME/sh/setup_step_01.sh

    installer_log "... step 02: setting up nginx"
    source $INSTALLER_HOME/sh/setup_step_02.sh

    installer_log "... step 03: setting up application stack"
    source $INSTALLER_HOME/sh/setup_step_03.sh

    installer_log "END setup" 
}

# Invoke entry point.
main
