# Imports.
source $INSTALLER_GLOBAL/sh/init_python.sh
source $INSTALLER_GLOBAL/sh/utils.sh

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
