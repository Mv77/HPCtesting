#!/bin/bash
#SBATCH --job-name=matlab_parallel
#SBATCH --time=2:0:0
#SBATCH --partition=parallel
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --output=log_parallel.txt
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mvelasq2@jhu.edu

module load matlab
matlab -nodisplay -nosplash -nodesktop -r "parallel_test"
echo "matlab exit code: $?"
