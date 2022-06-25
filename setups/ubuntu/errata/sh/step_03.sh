# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    installer_log "BEGIN step 3:"

    installer_log "... step 3.1: initialising python"
    _init_python

    installer_log "END step 3"
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
