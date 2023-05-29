#!/bin/bash

#SBATCH --output="/cluster/work/cvl/specta/experiment_logs/_tmp/%j.out"
#SBATCH --time=23:59:00
#SBATCH -n 1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=4096
#SBATCH --gpus=1 
#SBATCH --gres=gpumem:20000m
#SBATCH --job-name=test

#########SBATCH --gpus=rtx_2080_ti:1

# PYTHONPATH=
module load cuda/10.2.89 open3d/0.9.0

export PYTHONPATH=

source /cluster/home/nipopovic/python_envs/neuris/bin/activate


nvidia-smi

cd /cluster/project/cvl/specta/code/NeuRIS-fork


/cluster/home/nipopovic/python_envs/neuris/bin/python -u exp_runner.py \
--scene_name=scene0050_00 \
--nvs \



