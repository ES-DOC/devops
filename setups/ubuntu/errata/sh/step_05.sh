# Imports.
source $INSTALLER_GLOBAL/sh/constants.sh
source $INSTALLER_GLOBAL/sh/init_python.sh
source $INSTALLER_GLOBAL/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 5:"

    log "... step 5.1: initialising python venv"
    init_venv "/opt/esdoc-errata-ws" $INSTALLER_PYTHON_2

    log "END step 5"
}

# Invoke entry point.
main
