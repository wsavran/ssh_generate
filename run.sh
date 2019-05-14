#! /bin/bash

# Generates von Karman small-scale heterogeneities 
# 
# Examples
# ===========================================================================
# Example 1:
#   Generate heterogeneities on nx=256, ny=256, nz=128 mesh with 16 m spacing 
#   having the following von Karman parameters.
#       Hurst exponent: 0.05
#       Correlation length: 150 m
#       Anisotropy factor: 5
#       Random Seed: 1
#   We want to downsample the entire mesh by a factor of 2.
#      ./ssh_generate --d1 16 --hurst 0.05 --st23 5 --seed 1 --l1 150 --dmi 0 --dsfct1 2 -n1 128 -n2 256 -n3 256
# 
# Example  2:
#   Generate the same mesh as Example 1, but now downsample starting at index 50 by 3 points and starting at index 100 by 9 points.
#  
#       ./ssh_generate --d1 16 --hurst 0.05 --st23 5 --seed 1 --l1 150 --dmi 50 --dsfct1 3 --dmi2 100 --dsfct2 9 --n1 128 --n2 256 --n3 256
#
# Note:
#   Default is to perform no downsampling, so simply leave those options blank if none is needed.
#
# =============================================================================

# Input arguments
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
./ssh_generate --d1 $d1 \
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
