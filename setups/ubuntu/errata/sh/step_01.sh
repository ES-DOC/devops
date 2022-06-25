# Imports.
source $INSTALLER_HOME/sh/utils.sh

# Main entry point.
main()
{
    installer_log "BEGIN step 1:"

    installer_log "... step 1.1: initialising system"
    _init_sys

    installer_log "... step 1.2: initialising services"
    _ini

    installer_log "... step 1.3: initialising stack"
    _init_stack_repos
    _init_stack_env

    installer_log "END step 1"
}

# Initialise operating system.
function _init_sys()
{
    # Update OS.
    apt update -qq
    apt upgrade -qq
    apt autoremove -qq

    # Installs the C and C++ compilers, also the make command used to compile the CPython dependencies.
    apt install -qq dpkg-dev build-essential

    # Install libraries used on packages which implement OpenSSL.
    apt install -qq libffi-dev libssl-dev

    # Install basic utils.
    apt install -qq wget curl git gh

    # Installs the headers and static libraries of python 3 that are used to compile and mount the language extensions.
    apt install -qq python3-dev python3-venv

    # Install base of the most of packages that handle databases.
    apt install -qq libgdbm-dev

    # Install dependency of psycopg2 to work with PostgreSQL databases.
    apt install -qq libpq-dev

    # Install libraries used to handle XML on packages like lxml.
    apt install -qq libxml2-dev libxslt1-dev libxmlsec1-dev

    # Install other.
    apt install -qq \
        make \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        llvm \
        libncursesw5-dev \
        xz-utils \
        tk-dev \
        libxmlsec1-dev \
        liblzma-dev
}

# Initialise services.
function _init_services()
{
    apt install -qq \
        nginx \
        postgresql \
        postgresql-contrib

    ufw allow 'Nginx Full'
}

# Initialises source code repos.
function _init_stack_repos() {
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
function _init_stack_env() {
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
