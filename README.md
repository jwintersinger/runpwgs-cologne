Hello, Martin and Tsun-Po! Here are directions for running PhyloWGS:

1. Please edit `CONFIG.sh` and set `$BASEDIR` to where on the filesystem you want
   the work done. The rest of the README instructions will assume you've kept
   this at the default of `~/morrislab_runs`, so please adjust as necessary.

2. Run `bash install_pwgs.sh` to install PhyloWGS. Please note that you'll need
   GSL, Python 2.7, and Git available, which probably entails loading modules
   for them.

3. Run `bash run_test.sh`. Ensure that
   `~/morrislab_runs/test_run/test.{summ.json.gz,muts.json.gz,mutass.zip}` are
   all created.

4. Please download inputs from Jamboree at:

   /pancan/pcawg11/subclonal_architecture/morris/inputs/consensus.pwgs.runf.tar.gz

   Extract these to the inputs directory:

   ```
   cd ~/morrislab_runs/inputs
   tar xzf ~/consensus.pwgs.runf.tar.gz
   ```

5. Run `bash run_pcawg.sh runf` to generate a list of commands to submit to
   your queue.

6. Run `bash generate_outputs.sh runf` to generate a list of commands to submit
   to your queue to produce the outputs we'll need.
