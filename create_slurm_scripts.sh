echo "What test?"
read testname

echo "Email:"
read email

dir="./$testname"

# Create a file that will call all the submission files
s_all_file="${dir}/submit_all.sh"
echo "" > $s_all_file

# Create a submission file for every partition to test
for part in parallel shared skylake
do
	log_name="log_${part}.txt"
	# Slurm part
	file="${dir}/submit_$part.sh"
	echo "#!/bin/bash" > $file
	echo "#SBATCH --job-name=${testname}_${part}" >> $file
	echo "#SBATCH --time=24:0:0" >> $file
	echo "#SBATCH --partition=$part" >> $file
	echo "#SBATCH --nodes=1" >> $file
	echo "#SBATCH --ntasks-per-node=4" >> $file
	echo "#SBATCH --output=$log_name" >> $file
	if [ -n "${email}" ]
	then
		echo "#SBATCH --mail-type=ALL" >> $file
		echo "#SBATCH --mail-user=${email}" >> $file
	fi
	echo "" >>$file

	# Commands part, loaded from dir/commands.txt
	cmdfile="${dir}/commands.txt"
	cat $cmdfile >> $file

	# Add to the master submission file
	echo "sbatch submit_$part.sh" >> $s_all_file
done
