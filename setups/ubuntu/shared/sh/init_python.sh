# Initialise pyenv.
init_pyenv()
{
    if [[ ! -f $HOME/.pyenv/bin/pyenv ]]; then
        curl https://pyenv.run | bash
        cat $INSTALLER_SHARED/templates/shell-paths.txt >> $HOME/.bashrc
    fi
}

# JIT install python 2.
init_python_2()
{
    if [[ ! -d $HOME/.pyenv/versions/$INSTALLER_PYTHON_2 ]]; then
        pyenv install $INSTALLER_PYTHON_2
    fi
}

# JIT install python 3.
init_python_3()
{
    if [[ ! -d $HOME/.pyenv/versions/$INSTALLER_PYTHON_3 ]]; then
        pyenv install $INSTALLER_PYTHON_3
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
