#!/bin/bash
#SBATCH --job-name=matlab_defq
#SBATCH --time=2:0:0
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=48
#SBATCH --output=log_defq.txt
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mvelasq2@jh.edu

module load matlab
matlab -nodisplay -nosplash -nodesktop -r "parallel_test"
echo "matlab exit code: $?"
