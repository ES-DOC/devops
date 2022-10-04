# Imports.
source $INSTALLER_HOME/sh/utils/constants.sh
source $INSTALLER_HOME/sh/utils/general.sh
source $INSTALLER_HOME/sh/utils/python.sh

# Main entry point.
main()
{
    log "BEGIN step 3:"

    log "... step 3.1: initialising python 2"
    init_python $INSTALLER_PYTHON_2

    log "... step 3.2: initialising python 3"
    init_python $INSTALLER_PYTHON_3

    log "END step 3"
}

# Invoke entry point.
main
