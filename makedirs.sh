#!/bin/bash
set -euo pipefail
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPTDIR/CONFIG.sh

function makedirs {
  for dir in $INPUTSDIR $RUNDIR $OUTPUTSDIR; do
    mkdir -p $dir
  done
}

makedirs
