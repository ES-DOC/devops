# Imports.
source $INSTALLER_HOME/sh/utils/constants.sh
source $INSTALLER_HOME/sh/utils/general.sh

# Main entry point.
function main()
{
    log "BEGIN step 4:"

    log "... step 4.1: initialising repos"
	for REPO in "${INSTALLER_REPOS[@]}"
	do
        _init_repo $REPO
	done

    log "... step 4.2: initialising environment"
    _init_env

    log "... step 4.3: initialising ops directories"
    _install_ops_fsys

    log "... step 4.4: initialising ops configuration"
    _install_ops_config

    log "... step 4.5: initialising credentials"
    _init_credentials

    log "END step 4"
}

# Initialises application credentials.
function _init_credentials() {
    # Remove previous.
    if [[ -f $HOME/.esdoc/credentials ]]; then
        rm $HOME/.esdoc/credentials
    fi

    # Generate new.
    cat >> $HOME/.esdoc/credentials <<- EOM

# --------------------------------------------------------------------
# ESDOC - CREDENTIALS
# --------------------------------------------------------------------

# ES-DOC GitHub user
export ESDOC_GITHUB_USER_NAME=esdoc-system-user

# ES-DOC GitHub token
export ESDOC_GITHUB_ACCESS_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

# Password: DB -> ADMIN.
export ADMIN_DB_PWD=$(openssl rand -hex 16)

# Password: DB -> DOCUMENTATION.
export DOCUMENTATION_DB_PWD=$(openssl rand -hex 16)

# Password: DB -> ERRATA.
export ERRATA_DB_PWD=$(openssl rand -hex 16)

EOM
}

# Initialises stack environment.
function _init_env() {
    if [[ ! -d $HOME/.esdoc ]]; then
        mkdir $HOME/.esdoc
        cat $INSTALLER_HOME/templates/bashrc.txt >> $HOME/.bashrc
    fi
    cp $INSTALLER_HOME/templates/app_environment.txt $HOME/.esdoc/environment
}

# Initialise ops directories.
function _install_ops_config()
{
    # Config -> cdf2cim-ws.
    if [[ ! -f $INSTALLER_TARGET_DIR/esdoc-cdf2cim-ws/ops/config/ws.conf ]]; then
        cat $INSTALLER_HOME/templates/ws-app-cdf2cim.conf >> $INSTALLER_TARGET_DIR/esdoc-cdf2cim-ws/ops/config/ws.conf
    fi
    if [[ ! -f $INSTALLER_TARGET_DIR/esdoc-cdf2cim-ws/ops/config/supervisord.conf ]]; then
        cp $INSTALLER_HOME/templates/ws-supervisord-cdf2cim.conf $INSTALLER_TARGET_DIR/esdoc-cdf2cim-ws/ops/config/supervisord.conf
    fi

    # Config -> documentation-ws.
    if [[ ! -f $INSTALLER_TARGET_DIR/esdoc-documentation-ws/ops/config/ws.conf ]]; then
        cat $INSTALLER_HOME/templates/ws-app-documentation.conf >> $INSTALLER_TARGET_DIR/esdoc-documentation-ws/ops/config/ws.conf
    fi
    if [[ ! -f $INSTALLER_TARGET_DIR/esdoc-documentation-ws/ops/config/supervisord.conf ]]; then
        cp $INSTALLER_HOME/templates/ws-supervisord-documentation.conf $INSTALLER_TARGET_DIR/esdoc-documentation-ws/ops/config/supervisord.conf
    fi

    # Config -> errata-ws.
    if [[ ! -f $INSTALLER_TARGET_DIR/esdoc-errata-ws/ops/config/ws.conf ]]; then
        cat $INSTALLER_HOME/templates/ws-app-errata.conf >> $INSTALLER_TARGET_DIR/esdoc-errata-ws/ops/config/ws.conf
    fi
    if [[ ! -f $INSTALLER_TARGET_DIR/esdoc-errata-ws/ops/config/supervisord.conf ]]; then
        cp $INSTALLER_HOME/templates/ws-supervisord-errata.conf $INSTALLER_TARGET_DIR/esdoc-errata-ws/ops/config/supervisord.conf
    fi

    # Config -> pyessv-ws.
    if [[ ! -f $INSTALLER_TARGET_DIR/pyessv-ws/ops/config/ws.conf ]]; then
        cat $INSTALLER_HOME/templates/ws-app-pyessv.conf >> $INSTALLER_TARGET_DIR/pyessv-ws/ops/config/ws.conf
    fi
    if [[ ! -f $INSTALLER_TARGET_DIR/pyessv-ws/ops/config/supervisord.conf ]]; then
        cp $INSTALLER_HOME/templates/ws-supervisord-pyessv.conf $INSTALLER_TARGET_DIR/pyessv-ws/ops/config/supervisord.conf
    fi
}

# Initialise ops file system.
function _install_ops_fsys()
{
    _install_ops_fsys_dirs "esdoc-cdf2cim-ws"
    _install_ops_fsys_dirs "esdoc-documentation-ws"
    _install_ops_fsys_dirs "esdoc-errata-ws"
    _install_ops_fsys_dirs "pyessv-ws"
}

# Initialise ops directories.
function _install_ops_fsys_dirs()
{
    local REPO=${1}
    
    if [[ ! -d $INSTALLER_TARGET_DIR/$REPO/ops ]]; then
        mkdir -p $INSTALLER_TARGET_DIR/$REPO/ops
        mkdir -p $INSTALLER_TARGET_DIR/$REPO/ops/config
        mkdir -p $INSTALLER_TARGET_DIR/$REPO/ops/daemon
        mkdir -p $INSTALLER_TARGET_DIR/$REPO/ops/logs
    fi
}

# Initialises stack repo.
function _init_repo() {
    local REPO=${1}

    if [[ ! -d $INSTALLER_TARGET_DIR/$REPO ]]; then
        log "... ... cloning repo: "$REPO
        pushd $INSTALLER_TARGET_DIR
        git clone -q https://github.com/ES-DOC/$REPO.git
        popd
    else
        pushd $INSTALLER_TARGET_DIR/$REPO
        git pull -q
        popd
    fi
}

# Invoke entry point.
main
