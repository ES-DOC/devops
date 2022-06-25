# Imports.
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    installer_log "BEGIN step 3:"

    installer_log "... step 3.1: initialising python"
    source $INSTALLER_HOME/sh/step_03_01.sh

    installer_log "END step 3"
}

# Invoke entry point.
main
