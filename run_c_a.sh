#!/bin/bash
#SBATCH --job-name=SRDC
#SBATCH --output=SRDC_output.txt
#SBATCH --error=SRDC_error.log
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=gpucompute
#SBATCH --mem=20GB
#SBATCH --gres=gpu:1

module load cuda11.1/toolkit/11.1.1

srun python main.py  \
--data_path_source /data/home/jkataok1/CycleGAN-PyTorch/data/OfficeHomeDataset_10072016 \
--src Clipart  \
--data_path_target /data/home/jkataok1/CycleGAN-PyTorch/data/OfficeHomeDataset_10072016 \
--tar Art \
--data_path_target_t  /data/home/jkataok1/CycleGAN-PyTorch/data/OfficeHomeDataset_10072016 \
--tar_t Art \
--workers 1 \
--pretrained_path /data/home/jkataok1/alexnet_resnet_finetune/checkpoints/Clipart_to_Art_resnet50.pkl \
--learn_embed \
--src_cls \
--batch_size 42 \
--beta 1.0 \
--pretrained \
--cluster_method kernel_kmeans \
--epochs 50 \
--cluster_iter 20 \
--lr 0.001 \
--num_classes 65
