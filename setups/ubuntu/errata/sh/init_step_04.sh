# Main entry point.
main()
{
    # JIT install pyenv.
    if [[ ! -f /home/sphere0/.pyenv/bin/pyenv ]]; then
        curl https://pyenv.run | bash
    fi

    # JIT install python 2.7.18.
    if [[ ! -d /home/sphere0/.pyenv/versions/$INSTALLER_PYTHON_2 ]]; then
        pyenv install $INSTALLER_PYTHON_2
    fi
}

# Invoke entry point.
main
