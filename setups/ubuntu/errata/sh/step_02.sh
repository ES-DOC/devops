# Imports.
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    installer_log "BEGIN step 2:"

    installer_log "... step 2.1: initialising pyenv"
    source $INSTALLER_HOME/sh/step_02_01.sh

    installer_log "END step 2"
}

# Invoke entry point.
main
