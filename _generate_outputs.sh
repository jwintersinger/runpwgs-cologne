#!/bin/bash
set -euo pipefail
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RUN=$1
SAMPID=$2

source $SCRIPTDIR/CONFIG.sh

function generate_outputs {
  mkdir -p $OUTPUTSDIR
  cd $RUNDIR
  $PYTHON $PWGSDIR/write_results.py \
    --include-ssm-names \
    $SAMPID \
    $SAMPID/trees.zip \
    $OUTPUTSDIR/$SAMPID.{summ.json.gz,muts.json.gz,mutass.zip}
}

generate_outputs
