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

        export PATH="$HOME/.pyenv/bin:$PATH"
        eval "$(pyenv init --path)"
        eval "$(pyenv virtualenv-init -)"

EOM

        exec $SHELL
    fi

    # JIT install python 2.7.18.
    if [[ ! -d $HOME/.pyenv/versions/$INSTALLER_PYTHON_2 ]]; then
        pyenv install $INSTALLER_PYTHON_2
    fi
}

# Invoke entry point.
main
