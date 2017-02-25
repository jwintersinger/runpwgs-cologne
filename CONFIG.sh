set -euo pipefail
shopt -s nullglob

PYTHON=python2
PIP=pip2

# Please edit this setting.
BASEDIR=$HOME/morrislab_runs

# You shouldn't need to edit any of the following.
# ================================================

# RUN must be set by whatever script includes CONFIG.sh.

# Where PhyloWGS will be downloaded & installed to.
PWGSDIR=$BASEDIR/phylowgs
# Directory containing *.ssm and *.cnv files used as inputs by PhyloWGS,
# downloaded from Jamboree.
INPUTSDIR=$BASEDIR/inputs/consensus.pwgs.$RUN
# Where PhyloWGS will run.
RUNDIR=$BASEDIR/run.$RUN
# Where outputs to be uploaded to Jamboree will be written.
OUTPUTSDIR=$BASEDIR/outputs.$RUN

MH_ITERATIONS=500
