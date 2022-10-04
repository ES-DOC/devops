# Imports.
source $INSTALLER_HOME/sh/utils/general.sh
source $INSTALLER_HOME/sh/utils/python.sh

# Main entry point.
main()
{
    log "BEGIN step 2:"

    log "... step 2.1: initialising pyenv"
    init_pyenv

    log "END step 2"
}

# Invoke entry point.
main
