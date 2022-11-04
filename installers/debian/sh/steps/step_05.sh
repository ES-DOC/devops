# Imports.
source $INSTALLER_HOME/sh/utils/constants.sh
source $INSTALLER_HOME/sh/utils/general.sh
source $INSTALLER_HOME/sh/utils/python.sh

# Main entry point.
main()
{
    log "BEGIN step 5:"

    log "... step 5.1: initialising python virtual environment: esdoc-cdf2cim-ws"
    init_python_venv $INSTALLER_PYTHON_2 "$INSTALLER_TARGET_DIR/esdoc-cdf2cim-ws"

    log "... step 5.2: initialising python virtual environment: esdoc-documentation-ws"
    init_python_venv $INSTALLER_PYTHON_3 "$INSTALLER_TARGET_DIR/esdoc-documentation-ws"

    log "... step 5.3: initialising python virtual environment: esdoc-errata-ws"
    init_python_venv $INSTALLER_PYTHON_2 "$INSTALLER_TARGET_DIR/esdoc-errata-ws"

    log "... step 5.4: initialising python virtual environment: pyessv-ws"
    init_python_venv $INSTALLER_PYTHON_3 "$INSTALLER_TARGET_DIR/pyessv-ws"

    log "END step 5"
}

# Invoke entry point.
main
