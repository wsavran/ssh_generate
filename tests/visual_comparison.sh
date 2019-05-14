#! /bin/bash

# Generates von Karman small-scale heterogeneities 
# 
# Description: Runs comparison test between downsampling at the surface.
# Author:      William Savran
# Date:        05/13/2019

# Input arguments for first mesh
d1=16
hurst=0.05
l1=150
st23=5
seed=1
n1=150
n2=350
n3=250
dmi=-1
dmi2=-1
dsfct1=-1
dsfct2=-1
mesh="ssh_no_dec.out"

# Run the script
now=$(date +"%m_%d_%YT%H:%M:%s")
log_file=ssh_generate_"$now".log
echo "Generating distribution of velocity perturbations."
echo "  Writing log file to $log_file"
../ssh_generate --d1 $d1 \
               --hurst $hurst \
               --l1 $l1 \
               --st23 $st23 \
               --seed $seed \
               --n1 $n1 \
               --n2 $n2 \
               --n3 $n3 \
               --dmi $dmi \
               --dmi2 $dmi2 \
               --dsfct1 $dsfct1 \
               --dsfct2 $dsfct2 \
               --mesh $mesh > $log_file

# Input arguments for second mesh
d1=16
hurst=0.05
l1=150
st23=5
seed=1
n1=150
n2=350
n3=250
dmi=0
dmi2=-1
dsfct1=2
dsfct2=-1
mesh="ssh.out"

echo " "
echo "Generating second distribution."
echo "  Writing to same log file $log_file"
../ssh_generate --d1 $d1 \
               --hurst $hurst \
               --l1 $l1 \
               --st23 $st23 \
               --seed $seed \
               --n1 $n1 \
               --n2 $n2 \
               --n3 $n3 \
               --dmi $dmi \
               --dmi2 $dmi2 \
               --dsfct1 $dsfct1 \
               --dsfct2 $dsfct2 \
               --mesh $mesh >> $log_file

echo " "
echo "Generating plots of surface slices and histogram of differences."
python scripts/plot_mesh.py

