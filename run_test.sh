#!/bin/bash
set -euo pipefail
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPTDIR/CONFIG.sh

function run_test {
  TESTDIR=$BASEDIR/test_run

  rm -rf $TESTDIR
  mkdir -p $TESTDIR
  cd $TESTDIR

  TMPDIR=$(mktemp -d)
  $PYTHON $PWGSDIR/evolve.py -B 5 -s 5 --tmp-dir $TMPDIR --mh-iterations $MH_ITERATIONS $PWGSDIR/{ssm,cnv}_data.txt
  mkdir -p outputs
  cd outputs
  $PYTHON $PWGSDIR/write_results.py --include-ssm-names test ../trees.zip test.{summ.json.gz,muts.json.gz,mutass.zip}
}

run_test
