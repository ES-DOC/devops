#!/usr/bin/env bash

# Array of managed archives.
declare -a OPAL_ARCHIVES=(
	'esdoc-archive'
	'pyessv-archive'
	'esdoc-cdf2cim-archive'
)

# Array of managed libraries.
declare -a OPAL_LIBS=(
    # Web-services
    'esdoc-api'
    'esdoc-cdf2cim-ws'
    'esdoc-errata-ws'
	'pyessv-ws'

    # Web-sites
    'esdoc-web-compare'
    'esdoc-web-explorer'
    'esdoc-web-search'
    'esdoc-web-view'
    'esdoc-web-view-specialization'
    'esdoc-errata-fe'

    # Other
	'esdoc-py-client'
    'esdoc-web-static'
)

# Python versions.
declare -r OPAL_PYTHON_2=2.7.18
declare -r OPAL_PYTHON_3=3.9.0
