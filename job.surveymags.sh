#!/bin/bash
#SBATCH -p regular
#SBATCH -A des
##SBATCH --qos premium
#SBATCH -t 6:00:00
#SBATCH -J Chinchilla3-sm
#SBATCH -o Chinchilla3-sm.%j.oe
#SBATCH --mail-type=All
#SBATCH --mail-user  joe.derose13@gmail.com
#SBATCH -N 2
#SBATCH -C haswell
#SBATCH -L SCRATCH
#SBATCH --exclusive
#SBATCH --image=docker:jderose/addgals-stack:latest
#SBATCH --volume="/global/project/projectdirs/des/jderose/SkyFactory-config:/SkyFactory-config;/global/cscratch1/sd/jderose/BCC/Chinchilla/Herd/Chinchilla-3:/output"

srun -n 4 -c 16 shifter python /pyaddgals/bin/fix_rsd_and_integrate_bandpass.py addgals.cfg /global/project/projectdirs/desi/mocks/buzzard/buzzard_v2.0/buzzard-0/addgalspostprocess/surveymags aux
