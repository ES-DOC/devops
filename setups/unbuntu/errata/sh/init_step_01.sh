# Main entry point.
main()
{
    installer_log "... initialising system"

    # Update OS.
    apt update
    apt upgrade

    # Install base dependencies.
    _install_dependencies
}

# Installs base level dependencies.
_install_dependencies()
{
    # Installs the C and C++ compilers, also the make command used to compile the CPython dependencies.
    apt-get install dpkg-dev build-essential

    # Installs the headers and static libraries of python 2 and 3 that are used to compile and mount the language extensions.
    apt-get install python-dev python3-dev

    # Install libraries used on packages which implement OpenSSL.
    apt-get install libffi-dev libssl-dev

    # Install base of the most of packages that handle databases.
    apt-get install libgdbm-dev

    # Install dependency of psycopg2 to work with PostgreSQL databases.
    apt-get install libpq-dev

    # Install libraries used to handle XML on packages like lxml.
    apt-get install libxml2-dev libxslt1-dev
}

# Invoke entry point.
main
