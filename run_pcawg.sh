#!/bin/bash
set -euo pipefail
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RUN=$1
source $SCRIPTDIR/CONFIG.sh

function run_pcawg {
  cd $INPUTSDIR
  for samp in *.sampled.ssm; do
    sampid=$(echo $samp | cut -d. -f1)
    echo "bash $SCRIPTDIR/_run_pcawg.sh $RUN $sampid"
  done
}

run_pcawg
