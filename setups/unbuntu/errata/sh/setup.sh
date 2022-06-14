# Main entry point.
main()
{
    # Initialise machine in readiness for setup.
    source $INSTALLER_HOME/sh/setup_stack.sh
    source $INSTALLER_HOME/sh/setup_nginx.sh
    source $INSTALLER_HOME/sh/setup_pgres.sh
}

# Invoke entry point.
main
