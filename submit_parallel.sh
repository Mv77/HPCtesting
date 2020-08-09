!/bin/bash
#SBATCH --job-name = mytest
#SBATCH --time=24:0:0
#SBATCH --partition=parallel
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mvelasq2@jhu.edu

module load python/3.7
python parallel_test.py >> log_parallel.txt