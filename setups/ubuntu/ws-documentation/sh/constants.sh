#!/usr/bin/env bash

# Imports.
source $INSTALLER_SHARED/sh/constants.sh

# Array of managed libraries.
declare -a INSTALLER_REPOS=(
    'esdoc-errata-fe'
    'esdoc-errata-ws'
    'pyessv-archive'
)
