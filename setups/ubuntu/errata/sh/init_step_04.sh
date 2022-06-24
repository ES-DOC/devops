# Imports.
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    if [[ ! -d $HOME/.esdoc ]]; then
        mkdir $HOME/.esdoc
    fi

    if [[ ! -f $HOME/.esdoc/credentials.sh ]]; then
        cp $INSTALLER_HOME/templates/credentials.txt $HOME/.esdoc/credentials.sh
    fi

    if [[ ! -f $HOME/.esdoc/environment.sh ]]; then
        cp $INSTALLER_HOME/templates/environment.txt $HOME/.esdoc/environment.sh
    fi
}

# Invoke entry point.
main
