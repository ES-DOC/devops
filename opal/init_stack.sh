source $OPAL_HOME/sync.sh

function install_archive_cdf2cim() {
    opal_log "installing archive: cdf2cim ... make take some time ... please wait"

    sync_archive "esdoc-cdf2cim-archive"
}

function install_archive_documentation() {
    opal_log "installing archive: documentation ... make take some time ... please wait"

    sync_archive "esdoc-archive"

    source $HOME/archives/esdoc-archive/sh/activate
    source $ESDOC_ARCHIVE_HOME/sh/uncompress.sh
}

function install_archive_pyessv() {
    opal_log "installing archive: pyessv ... make take some time ... please wait"

    sync_archive "pyessv-archive"
}

function install_ws_cdf2cim() {
    opal_log "installing ws: cdf2cim ..."

    sync_lib "esdoc-cdf2cim-ws"
}

function install_ws_documentation() {
    opal_log "installing ws: documentation ..."

    sync_lib "esdoc-api"    
}

function install_ws_errata() {
    opal_log "installing ws: errata ..."

    sync_lib "esdoc-errata-ws"
}

function install_ws_pyessv() {
    opal_log "installing ws: pyessv ..."

    sync_lib "pyessv-ws"

    source $HOME/libs/pyessv-ws/sh/activate
    source $PYESSV_WS_HOME/sh/install.sh
}

function install_fe_compare() {
    opal_log "installing fe: compare ..."

    sync_lib "esdoc-web-compare"
}

function install_fe_errata() {
    opal_log "installing fe: errata ..."

    sync_lib "esdoc-errata-fe"
}

function install_fe_search() {
    opal_log "installing fe: search ..."

    sync_lib "esdoc-web-search"
}

function install_fe_view() {
    opal_log "installing fe: view ..."

    sync_lib "esdoc-web-view"
}

function install_fe_view_specialization() {
    opal_log "installing fe: view specialization ..."

    sync_lib "esdoc-web-view-specialization"
}

function install_other_pyesdoc() {
    opal_log "installing other: pyesdoc ..."

    sync_lib "esdoc-py-client"
}

function install_other_static() {
    opal_log "installing other: static ..."

    sync_lib "esdoc-web-static"
}

#######################################
# Entry point: installs apps/services upon.
#######################################
install_archive_cdf2cim
install_archive_documentation
install_archive_pyessv
install_ws_cdf2cim
install_ws_documentation
install_ws_errata
install_ws_pyessv
install_fe_compare
install_fe_errata
install_fe_search
install_fe_view
install_fe_view_specialization
install_other_pyesdoc
install_other_static
