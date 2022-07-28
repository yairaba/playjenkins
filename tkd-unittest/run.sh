#!/bin/bash

export WORKON_HOME=/opt/virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
. /usr/local/bin/virtualenvwrapper.sh
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/

echo Who wsssssssssssss I $SHELL
workon venv_worker
dd2virtualenv $WORKSPACE/java/analysis_infra

