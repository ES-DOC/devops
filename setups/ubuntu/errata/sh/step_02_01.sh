# Main entry point.
main()
{
    # JIT install pyenv.
    if [[ ! -f $HOME/.pyenv/bin/pyenv ]]; then
        curl https://pyenv.run | bash

        cat >> "$HOME/.bashrc" <<- EOM

# ----------------------------------------------------------------------
# PYENV
# ----------------------------------------------------------------------

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init --path)"

EOM

        source $HOME/.bashrc
    fi

    # JIT install python 2.
    if [[ ! -d $HOME/.pyenv/versions/$INSTALLER_PYTHON_2 ]]; then
        pyenv install $INSTALLER_PYTHON_2
    fi
}

# Invoke entry point.
main
