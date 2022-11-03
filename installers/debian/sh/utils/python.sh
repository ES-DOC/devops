#!/usr/bin/env bash

# Initialise pyenv.
init_pyenv()
{
    if [[ ! -f $HOME/.pyenv/bin/pyenv ]]; then
        curl https://pyenv.run | bash
        cat $INSTALLER_HOME/templates/shell-paths.txt >> $HOME/.bashrc
    fi
}

# JIT install python.
init_python()
{
    local PYTHON_VERSION=${1}

    if [[ ! -d $HOME/.pyenv/versions/$PYTHON_VERSION ]]; then
        pyenv install $PYTHON_VERSION
    fi
}

# Initialise python virtual environment.
init_python_venv()
{
    local TARGET_PYTHON=${1}
    local TARGET_DIR=${2}

    pushd $TARGET_DIR
    pyenv local --unset
    pyenv local $TARGET_PYTHON
    pip install --upgrade pip
    pip install --upgrade pipenv
    pip install --upgrade supervisor
    pipenv run pipenv install
    popd
}
