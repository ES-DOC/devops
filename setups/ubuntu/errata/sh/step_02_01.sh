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
        command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$($HOME/.pyenv/bin/pyenv init -)"
        eval "$($HOME/.pyenv/bin/pyenv virtualenv-init -)"

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
