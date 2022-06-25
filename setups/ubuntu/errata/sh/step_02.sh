# Imports.
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    installer_log "BEGIN step 2:"

    installer_log "... step 2.1: initialising pyenv"
    _init_pyenv

    installer_log "END step 2"
}

# JIT install pyenv.
_init_pyenv()
{
    if [[ ! -f $HOME/.pyenv/bin/pyenv ]]; then
        curl https://pyenv.run | bash
        cat $INSTALLER_HOME/templates/pyenv.txt >> $HOME/.bashrc
    fi
}

# Invoke entry point.
main
