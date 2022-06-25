# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    installer_log "BEGIN step 4:"

    installer_log "... step 4.1: initialising python environment"
    _init_python_env

    installer_log "END step 4"
}

# Initialise python environment.
_init_python_env()
{
    pushd /opt/esdoc/esdoc-errata-ws
    pyenv local $INSTALLER_PYTHON_2
    pip install pipenv
    pipenv install
    popd
}

# Invoke entry point.
main
