# coding: utf-8

from numpy import fromfile
from matplotlib.pyplot import subplots, show

m1 = fromfile('ssh_no_dec.out', '<f4').reshape([150,250,350])
m2 = fromfile('ssh.out', '<f4').reshape([150,250,350])

f1, ax1 = subplots()
ax1.imshow(m1[0,:,:], origin='normal')
ax1.set_title('Surface Slice\nDownsampling by 2 points')

f2, ax2 = subplots()
ax2.imshow(m2[0,:,:], origin='normal')
ax2.set_title('Surface Slice\nNo Downsampling')

diff = m1[0,:,:] - m2[0,:,:]
f3, ax3 = subplots()
ax3.imshow(diff, origin='normal')
ax3.set_title('Surface Slice\nDifference Plot')

f4, ax4 = subplots()
ax4.hist(diff.ravel(), bins=100, alpha=0.5, color='blue', edgecolor='black')
ax4.set_title('Histogram of Differences')
show()
