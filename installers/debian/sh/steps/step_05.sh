# Imports.
source $INSTALLER_SHARED/sh/utils/constants.sh
source $INSTALLER_SHARED/sh/utils/general.sh
source $INSTALLER_SHARED/sh/utils/python.sh

# Main entry point.
main()
{
    log "BEGIN step 5:"

    log "... step 5.1: initialising python virtual environments"
    init_python_venv $INSTALLER_PYTHON_2 "/opt/documentation-ws"
    init_python_venv $INSTALLER_PYTHON_3 "/opt/esdoc-cdf2cim-ws"
    init_python_venv $INSTALLER_PYTHON_2 "/opt/esdoc-errata-ws"
    init_python_venv $INSTALLER_PYTHON_3 "/opt/pyessv-ws"

    log "END step 5"
}

# Invoke entry point.
main
