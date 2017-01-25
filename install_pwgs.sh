#!/bin/bash
set -euo pipefail
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPTDIR/CONFIG.sh

# Prerequisities:
#   * Python 2.7 with NumPy and SciPy
#   * gsl (https://www.gnu.org/software/gsl/)
#   * Git

function install {
  $PIP install --user ete2
  rm -rf $PWGSDIR
  git clone https://github.com/morrislab/phylowgs.git $PWGSDIR
  cd $PWGSDIR
  git checkout polyclonalfix
  g++ -o mh.o -O3 mh.cpp  util.cpp `gsl-config --cflags --libs`
}

install
