# Imports.
source $INSTALLER_SHARED/sh/constants.sh
source $INSTALLER_SHARED/sh/init_python.sh
source $INSTALLER_SHARED/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 5:"

    log "... step 5.1: initialising python venv"
    init_venv "/opt/pyessv-ws" $INSTALLER_PYTHON_3

    log "END step 5"
}

# Invoke entry point.
main
