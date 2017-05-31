#!/bin/bash

# Read-only
export ETC=$(dirname $(pwd))/etc

# Read-only
export WORKFLOW_SOURCES=$(dirname $(pwd))/workflow

# Read-only
export ONTOLOGIES=$(dirname $(pwd))/target/ontologies

# Read-only
export FUSEKI_HOME=$(dirname $(pwd))/target/fuseki

export FUSEKI_BIN="${FUSEKI_HOME}/bin"

# Read-only
export TOOLS=$(dirname $(pwd))/target/tools

# Read/write
export WORKFLOW=$(dirname $(pwd))/target/workflow

# Read/write
export FUSEKI_BASE=$(dirname $(pwd))/target/run

[ ! -d $WORKFLOW ] && mkdir -p $WORKFLOW

export PARALLEL_MAKE_OPTS="-j8 -l16"

export JENA_DATASET="imce-ontologies"

export JENA_HOST="localhost"

export JENA_PORT="8898"

# Add as maven dependency
export DOCBOOK_XHTML_XSL="${TOOLS}/docbook/xhtml/docbook.xsl"
