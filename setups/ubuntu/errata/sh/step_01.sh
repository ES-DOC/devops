# Imports.
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    installer_log "BEGIN step 1:"

    installer_log "... step 1.1: initialising system"
    source $INSTALLER_HOME/sh/step_01_01.sh

    installer_log "... step 1.2: initialising services"
    source $INSTALLER_HOME/sh/step_01_02.sh

    installer_log "... step 1.3: initialising stack"
    source $INSTALLER_HOME/sh/step_01_03.sh

    installer_log "END step 1"
}

# Invoke entry point.
main
