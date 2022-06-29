#!/usr/bin/env bash

# Imports.
source $INSTALLER_SHARED/sh/constants.sh

# Array of managed repos.
declare -a INSTALLER_REPOS=(
    'pyessv'
    'pyessv-archive'
    'pyessv-js'
    'pyessv-writers'
    'pyessv-ws'
)

# Set of external git repos.
declare -a ESDOC_REPOS_EXT=(
	'https://github.com/ESGF/esgf-config.git'
	'https://github.com/ESGF/esgf-prepare.git'
	'https://github.com/WCRP-CMIP/CMIP6_CVs.git'
)
