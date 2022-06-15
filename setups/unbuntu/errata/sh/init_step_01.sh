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
    apt install dpkg-dev build-essential

    # Install libraries used on packages which implement OpenSSL.
    apt install libffi-dev libssl-dev

    # Install basic utils.
    apt install wget curl git gh

    # Installs the headers and static libraries of python 3 that are used to compile and mount the language extensions.
    apt install python3-dev python3-venv

    # Install base of the most of packages that handle databases.
    apt install libgdbm-dev

    # Install dependency of psycopg2 to work with PostgreSQL databases.
    apt install libpq-dev

    # Install libraries used to handle XML on packages like lxml.
    apt install libxml2-dev libxslt1-dev libxmlsec1-dev

    # Install other.
    apt install \
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

# Invoke entry point.
main
