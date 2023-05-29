#!/bin/bash

#SBATCH --output="/cluster/work/cvl/specta/experiment_logs/_tmp/%j.out"
#SBATCH --time=23:59:00
#SBATCH -n 1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=4096
#SBATCH --gpus={N_GPU}  
#SBATCH --gres=gpumem:20000m
#SBATCH --job-name=test

########SBATCH --gpus=rtx_2080_ti:1

module load python_gpu/3.7.4
PYTHONPATH=
export PYTHONPATH
source /cluster/home/nipopovic/python_envs/neuris/bin/activate

# Trick to prevent crashes due to matplotlib
DISPLAY=
export DISPLAY

mkdir ${TMPDIR}/dimitrios_gaze/
rsync -aPq /cluster/work/cvl/specta/data/dimitrios_gaze/ ${TMPDIR}/dimitrios_gaze
ls ${TMPDIR}
ls ${TMPDIR}/dimitrios_gaze

nvidia-smi

cd /cluster/project/cvl/specta/code/3D-eye-model-seg/

B=1
F=10
MODEL=DenseEl3
N_ang=72
N_rad=8

# 'OpenEDS_S' 'TEyeD'
#--net_ellseg_head \
#--net_simply_head \
#--loss_rend_vectorized \
/cluster/home/nipopovic/python_envs/ellseg/bin/python -u run.py \


