#!/bin/sh
#
#SBATCH --account=sz3091      # The account name for the job.
#SBATCH --job-name=DiffusionModel # The job name.
#SBATCH --gres=gpu:4             # Request 4 GPUs.
#SBATCH --constraint=k80         # Request K80 GPUs specifically.
#SBATCH -c 1                     # The number of CPU cores to use.
#SBATCH --time=5:00:00           # The time the job will take to run (5 hours).
#SBATCH --mem-per-cpu=4gb        # The memory the job will use per CPU core.

module load anaconda

# Set these variables according to your project
DATASET="{DATASET}"
PROJECT_PATH="{PROJECT_PATH}"
STEPS="{STEPS}"
ETA="{ETA}"

# Command to execute the Python program
python main.py --config ${DATASET}.yml --exp ${PROJECT_PATH} --use_pretrained --sample --fid --timesteps 100 --ni

#End of script
