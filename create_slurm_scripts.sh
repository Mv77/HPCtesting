echo "Hello"

dir="./python"

# Create a file that will call all the submission files
s_all_file="${dir}/submit_all.sh"

# Create a submission file for every partition to test
for part in parallel shared skylake
do
	# Slurm part
	file="${dir}/submit_$part.sh"
	echo "!/bin/bash" > $file
	echo "#SBATCH --job-name = mytest" >> $file 
	echo "#SBATCH --time=24:0:0" >> $file
	echo "#SBATCH --partition=$part" >> $file
	echo "#SBATCH --nodes=1" >> $file
	echo "#SBATCH --ntasks-per-node=4" >> $file
	echo "#SBATCH --mail-type=ALL" >> $file
	echo "#SBATCH --mail-user=mvelasq2@jhu.edu" >> $file

	echo "" >>$file

	# Commands part, loaded from dir/commands.txt
	cmdfile="${dir}/commands.txt"
	cat $cmdfile >> $file

	# Add to the master submission file
	echo "sbatch submit_$part.sh" >> $s_all_file
done
