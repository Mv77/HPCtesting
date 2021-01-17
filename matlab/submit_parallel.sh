#!/bin/bash
#SBATCH --job-name=matlab_parallel
#SBATCH --time=24:0:0
#SBATCH --partition=parallel
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --output=log_parallel.txt

export OMP_NUM_THREADS=24
module load matlab
matlab -nodisplay -nosplash -nodesktop -r "parallel_test"
echo "matlab exit code: $?"
