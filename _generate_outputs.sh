#!/bin/bash
set -euo pipefail
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPTDIR/CONFIG.sh

function generate_outputs {
  sampid=$1
  cd $RUNDIR
  $PYTHON $PWGSDIR/write_results.py \
    $sampid \
    $sampid/trees.zip \
    $OUTPUTSDIR/$sampid.{summ.json.gz,muts.json.gz,mutass.zip}
}

generate_outputs $1
