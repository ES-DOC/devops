# Main entry point.
main()
{
    if [[ ! -d /opt/esdoc ]]; then
        mkdir /opt/esdoc
    fi

    if [[ ! -d /opt/esdoc/esdoc-errata-fe ]]; then
        pushd /opt/esdoc
        git clone https://github.com/ES-DOC/esdoc-errata-fe.git
        popd
    else
        pushd /opt/esdoc/esdoc-errata-fe
        git pull
        popd
    fi

    if [[ ! -d /opt/esdoc/esdoc-errata-ws ]]; then
        pushd /opt/esdoc    
        git clone https://github.com/ES-DOC/esdoc-errata-ws.git
        popd
    else
        pushd /opt/esdoc/esdoc-errata-ws
        git pull
        popd
    fi
}

# Invoke entry point.
main
