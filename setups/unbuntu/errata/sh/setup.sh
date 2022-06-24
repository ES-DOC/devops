# Imports.
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
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
