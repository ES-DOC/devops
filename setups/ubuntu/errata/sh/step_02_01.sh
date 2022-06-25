# Main entry point.
main()
{
    # JIT install pyenv.
    if [[ ! -f $HOME/.pyenv/bin/pyenv ]]; then
        curl https://pyenv.run | bash
        cat $INSTALLER_HOME/templates/pyenv.txt >> $HOME/.bashrc
        exec $SHELL
    fi
}

# Invoke entry point.
main
