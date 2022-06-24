# Main entry point.
function main()
{
    _init_repos
    _init_env
}

# Initialises source code repos.
function _init_repos() {
    if [[ ! -d /opt/esdoc ]]; then
        mkdir /opt/esdoc
    fi

    if [[ ! -d /opt/esdoc/esdoc-errata-fe ]]; then
        pushd /opt/esdoc
        git clone -q https://github.com/ES-DOC/esdoc-errata-fe.git
        popd
    else
        pushd /opt/esdoc/esdoc-errata-fe
        git pull -q
        popd
    fi

    if [[ ! -d /opt/esdoc/esdoc-errata-ws ]]; then
        pushd /opt/esdoc    
        git clone -q https://github.com/ES-DOC/esdoc-errata-ws.git
        popd
    else
        pushd /opt/esdoc/esdoc-errata-ws
        git pull -q
        popd
    fi
}

# Initialises application environment files.
function _init_env() {
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
