#!/usr/bin/env bash

# Initialise operating system.
function init_sys_libs()
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
    apt install -qq wget curl git

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
        liblzma-dev \
        ufw
}

# Initialise service - postgreSQL.
function init_sys_service_pgres()
{
    apt install -qq postgresql postgresql-contrib
    cat $INSTALLER_HOME/templates/shell-postgresql.txt >> $HOME/.bashrc
    systemctl start postgresql.service
}

# Initialise service - nginx.
function init_sys_service_nginx()
{
    apt install -qq nginx
    ufw allow 'Nginx Full'
}

# Initialise permissions.
function init_sys_permissions()
{
    chmod 777 /opt/esdoc
    chmod 777 /var/lib
}
