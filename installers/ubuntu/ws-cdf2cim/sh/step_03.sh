# Imports.
source $INSTALLER_SHARED/sh/constants.sh
source $INSTALLER_SHARED/sh/init_python.sh
source $INSTALLER_SHARED/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 3:"

    log "... step 3.1: initialising python"
    init_python $INSTALLER_PYTHON_3

    log "END step 3"
}

# Invoke entry point.
main
