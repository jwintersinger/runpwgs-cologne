#!/bin/bash
set -euo pipefail
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RUN=$1
SAMPID=$2

source $SCRIPTDIR/CONFIG.sh

function run_pcawg {
  SAMPRUNDIR=$RUNDIR/$SAMPID
  rm -rf $SAMPRUNDIR && mkdir -p $SAMPRUNDIR
  cd $SAMPRUNDIR

  TMPDIR=$(mktemp -d)
  $PYTHON $PWGSDIR/evolve.py \
    --tmp-dir $TMPDIR \
    --mh-iterations $MH_ITERATIONS \
    $INPUTSDIR/$SAMPID.sampled.{ssm,cnv} \
    > stdout.log 2> stderr.log
}

run_pcawg
