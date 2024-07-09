#!/bin/bash

mkdir -p cache

for psi in 0.5 ; do
    for loss_func in "weighted_MAPE" ; do
        for layers in "20-20_1"; do
            python u1equiv_train.py --seed 1234 \
                                     --n_pairs 10000\
                                     --batch_size 1000\
                                     --function "f0" \
                                     --psi $psi \
                                     --layers $layers \
                                     --save_dir "experiments-marek" \
                                     --save_name "${layers}" \
                                     --optimizer 'adam'\
                                     --learning_rate 0.001 \
                                     --decay_rate 1 \
                                     --max_epochs 1000\
                                     --loss_func ${loss_func} \
                                     --cache_folder "cache"
        done
    done
done
