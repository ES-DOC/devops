# Imports.
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "BEGIN step 2:"

    log "... step 2.1: initialising pyenv"
    _init_pyenv

    log "END step 2"
}


# Initialise pyenv.
_init_pyenv()
{
    if [[ ! -f $HOME/.pyenv/bin/pyenv ]]; then
        curl https://pyenv.run | bash
        cat $INSTALLER_HOME/templates/shell-pyenv.txt >> $HOME/.bashrc
    fi
}

# Invoke entry point.
main
