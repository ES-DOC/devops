# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 2:"

    log "... step 2.1: initialising python"
    _init_python

    log "END step 2"
}

# JIT install python 2.
_init_python()
{
    if [[ ! -d $HOME/.pyenv/versions/$INSTALLER_PYTHON_2 ]]; then
        pyenv install $INSTALLER_PYTHON_2
    fi
}

# Invoke entry point.
main
