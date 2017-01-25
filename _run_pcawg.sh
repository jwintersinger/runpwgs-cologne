#!/bin/bash
set -euo pipefail
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPTDIR/CONFIG.sh

function run_pcawg {
  sampid=$1
  SAMPRUNDIR=$RUNDIR/$sampid
  rm -rf $SAMPRUNDIR && mkdir -p $SAMPRUNDIR
  cd $SAMPRUNDIR

  TMPDIR=$(mktemp -d)
  $PYTHON $PWGSDIR/evolve.py \
    --tmp-dir $TMPDIR \
    --mh-iterations $MH_ITERATIONS \
    $INPUTSDIR/$sampid.sampled.{ssm,cnv} \
    > stdout.log 2> stderr.log
}

run_pcawg $1
