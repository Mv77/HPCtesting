echo "Hello"
file="submit.sh"
echo "!/bin/bash" > $file
echo "#SBATCH --job-name = mytest" >> $file 
echo "#SBATCH --time=24:0:0" >> $file
echo "#SBATCH --partition=parallel" >> $file
echo "#SBATCH --nodes=1" >> $file
echo "#SBATCH --ntasks-per-node=4" >> $file
echo "#SBATCH --mail-type=ALL" >> $file
echo "#SBATCH --mail-user=mvelasq2@jhu.edu" >> $file

echo "" >>$file

echo "module load python/3.7" >> $file
echo "python parallel_test.py >> log_par.txt" >> $file

