# HPC tests
This is a repo that is meant to contain tools for "testing" High Performance Clusters that use the SLURM worload manager.

Tests consist of submitting a simple job in some programming language that executes and times some operations both sequentially and in parallel.

The repo contains a bash script that can be used to generate other bash scripts for submitting a job to various different `partitions` (e.g. `parallel`, `scratch`, and `skylake` in the case of MARCC).
