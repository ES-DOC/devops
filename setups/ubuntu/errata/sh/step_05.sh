# Imports.
source $INSTALLER_HOME/sh/constants.sh
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 5:"

    log "... step 5.1: initialising python venv"
    _init_venv

    log "END step 5"
}

# Initialise python virtual env.
_init_venv()
{
    pushd /opt/esdoc-errata-ws
    pyenv local --unset
    pyenv local $INSTALLER_PYTHON_2
    pip install pipenv
    pipenv run pipenv install
    popd
}

# Invoke entry point.
main
