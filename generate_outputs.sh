#!/bin/bash
set -euo pipefail
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RUN=$1
source $SCRIPTDIR/CONFIG.sh

function generate_outputs {
  cd $RUNDIR
  mkdir -p $OUTPUTSDIR
  tar czf $OUTPUTSDIR/logs.tar.gz */{mcmc_samples.txt,random_seed.txt,stderr.log,stdout.log}

  for sampid in *; do
    echo "bash $SCRIPTDIR/_generate_outputs.sh $RUN $sampid"
  done
}

generate_outputs
