# SSH Generate

Generate 3D distributions of von Karman random numbers. Useful for adding noise
to 3D volumes.

Code originally written by David Gill and modified by Daniel Roten and William
Savran.

## Examples
Basic usage of the code. Either modify the `run.sh` script with appropriate variables or call
directly from the command line as shown below

### Example 1
  <p>
   Generate heterogeneities on nx=256, ny=256, nz=128 mesh with 16 m spacing
   having the following von Karman parameters.
       Hurst exponent: 0.05
       Correlation length: 150 m
       Anisotropy factor: 5
       Random Seed: 1
   We want to downsample the entire mesh by a factor of 2.  
   </p>
   ```
      ./ssh_generate --d1 16 --hurst 0.05 --st23 5 --seed 1 --l1 150 --dmi 0 --dsfct1 2 -n1 128 -n2 256 -n3 256
 ```

 <b>Example  2:</b>
   Generate the same mesh as Example 1, but now downsample starting at index 50 by 3 points and starting at index 100 by 9 points.

       ./ssh_generate --d1 16 --hurst 0.05 --st23 5 --seed 1 --l1 150 --dmi 50 --dsfct1 3 --dmi2 100 --dsfct2 9 --n1 128 --n2 256 --n3 256

 Note:
   Default is to perform no downsampling, so simply leave those options blank if none is needed.

## Visual Comparison
Two meshes can be compared by modifying the `visual_comparison.sh` script in the `tests` directory. The default comparisons shows two identical meshes, but one is decimated by a factor of 2.
