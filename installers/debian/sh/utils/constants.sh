#!/usr/bin/env bash

# Python versions.
declare INSTALLER_PYTHON_2=2.7.18
declare INSTALLER_PYTHON_3=3.10.7

# Array of managed libraries.
declare -a INSTALLER_REPOS=(
    'esdoc-archive'
    'esdoc-cdf2cim'
    'esdoc-cdf2cim-archive'
    'esdoc-cdf2cim-archive-subsetted'
    'esdoc-cdf2cim-indexer'
    'esdoc-cdf2cim-ws'
    'esdoc-documentation-fe'
    'esdoc-documentation-ws'
    'esdoc-errata-client'
    'esdoc-errata-fe'
    'esdoc-errata-ws'
    'esdoc-machine-fe'
    'esdoc-technical'
    'esdoc-url-rewriter'
    'esdoc-web-compare'
    'esdoc-web-explorer'
    'esdoc-web-search'
    'esdoc-web-view'
    'esdoc-web-view-specialization'
    'pyesdoc'
    'pyessv'
    'pyessv-archive'
    'pyessv-config'
    'pyessv-docs'
    'pyessv-js'
    'pyessv-ws'
)
