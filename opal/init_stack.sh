source $OPAL_HOME/sync.sh

#######################################
# Initialises file sytstem.
# Globals:
#   HOME - current user's home directory.
#   OPAL_ARCHIVES - array of managed archives.
#   OPAL_LIBS - array of managed libraries.
#######################################
function init_fs() {
    if [[ ! -d $HOME/archives ]]; then
        mkdir $HOME/archives
    fi    
    if [[ ! -d $HOME/libs ]]; then
        mkdir $HOME/libs
    fi 
    if [[ ! -d $HOME/.esdoc ]]; then
        mkdir $HOME/.esdoc
    fi
}

#######################################
# Initialises a repo.
# Globals:
#   HOME - current user's home directory.
# Arguments:
#   Repo type.
#   Repo name.
#######################################
function init_repo() {
    local REPO_TYPE=${1}
    local REPO_NAME=${2}
    local REPO_URL=https://github.com/ES-DOC/$REPO_NAME.git

    pushd $HOME/$REPO_TYPE
    git clone REPO_URL > /dev/null 2>&1
    popd 1
}

#######################################
# Initialises set of managed repo.
# Globals:
#   OPAL_ARCHIVES - array of managed archives.
#   OPAL_LIBS - array of managed libraries.
#######################################
function init_repos() {
    # Initialise archives.
	for TARGET in "${OPAL_ARCHIVES[@]}"
	do
        opal_log "... ... "$TARGET
        init_repo "archives" $TARGET
	done     

    # Initialise libraries.
	for TARGET in "${OPAL_LIBS[@]}"
	do
        opal_log "... ... "$TARGET
        init_repo "libs" $TARGET
	done 
}

#######################################
# Initialises virtual environments.
# Globals:
#   HOME - current user's home directory.
#   OPAL_ARCHIVES - array of managed archives.
#   OPAL_LIBS - array of managed libraries.
#######################################
function init_venvs() {
    pushd $HOME/libs/esdoc-api
    pyenv local $OPAL_PYTHON_2
    popd -1

    pushd $HOME/libs/esdoc-cdf2cim-ws
    pyenv local $OPAL_PYTHON_3
    popd -1

    pushd $HOME/libs/esdoc-errata-ws
    pyenv local $OPAL_PYTHON_2
    popd -1

    pushd $HOME/libs/pyessv-ws
    pyenv local $OPAL_PYTHON_3
    popd -1
  
    pushd $HOME/libs/esdoc-py-client
    pyenv local $OPAL_PYTHON_2
    popd -1
}

function init_archive_documentation() {
    opal_log "installing archive: documentation ... make take some time ... please wait"

    sync_archive "esdoc-archive"

    source $HOME/archives/esdoc-archive/sh/activate
    source $ESDOC_ARCHIVE_HOME/sh/uncompress.sh
}

function init_ws_pyessv() {
    opal_log "installing ws: pyessv ..."

    # Set source code. 
    sync_lib "pyessv-ws"

    # Set python.
    pushd $HOME/libs/pyessv-ws
    pyenv local 3.9.0
    popd -1

    # Execute installer.
    source $HOME/libs/pyessv-ws/sh/activate
    source $HOME/libs/pyessv-ws/sh/install.sh
}

#######################################
# Initialises stack.
# Globals:
#   HOME - current user's home directory.
#######################################
function main() {
    init_fs
    init_repos
    init_venvs
}

# Invoke entry point.
main
