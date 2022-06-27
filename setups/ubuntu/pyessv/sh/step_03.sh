# Imports.
source $INSTALLER_GLOBAL/sh/init_python.sh
source $INSTALLER_GLOBAL/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 3:"

    log "... step 3.1: initialising python 3"
    init_python_3

    log "END step 3"
}

# Invoke entry point.
main
