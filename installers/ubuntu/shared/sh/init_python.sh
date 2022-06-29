# Initialise pyenv.
init_pyenv()
{
    if [[ ! -f $HOME/.pyenv/bin/pyenv ]]; then
        curl https://pyenv.run | bash
        cat $INSTALLER_SHARED/templates/shell-paths.txt >> $HOME/.bashrc
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

# JIT install python virtual environment.
init_venv()
{
    local TARGET_DIR=${1}
    local TARGET_PYTHON=${2}

    pushd $TARGET_DIR
    pyenv local --unset
    pyenv local $TARGET_PYTHON
    pip install pipenv
    pipenv run pipenv install
    popd
}
