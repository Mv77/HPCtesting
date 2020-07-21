#!/bin/bash
#SBATCH --job-name=test_py_sky
#SBATCH --time=24:0:0
#SBATCH --partition=skylake
#SBATCH --nodes=1
# number of tasks (processes) per node
#SBATCH --ntasks-per-node=4
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mvelasq2@jhu.edu

#### load and unload modules you may need
module load python/3.7

python parallel_test.py >> log_sky.txt
