# Imports.
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    log "... setting up application stack"

    # Copy credentials & environment files.
    mkdir $HOME/.esdoc
    cp $INSTALLER_HOME/templates/credentials.txt $HOME/.esdoc/credentials.sh
    cp $INSTALLER_HOME/templates/environment.txt $HOME/.esdoc/environment.sh

    # TODO: update & activate bashrc.sh
}

# Invoke entry point.
main