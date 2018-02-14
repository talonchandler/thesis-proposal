import matplotlib.pyplot as plt

from mpl_toolkits.axes_grid1.inset_locator import zoomed_inset_axes
from mpl_toolkits.axes_grid1.inset_locator import mark_inset
from mpl_toolkits.axes_grid1.inset_locator import InsetPosition
from scipy import misc
import numpy as np

fig, ax = plt.subplots(figsize=[6, 4])

im = misc.imread('output_large.png')

large_dim = np.max(im.shape)
extent = [0, im.shape[1]/large_dim, 0, im.shape[0]/large_dim]
ax.imshow(im, extent=extent, interpolation="nearest",
          origin="upper")

axins = zoomed_inset_axes(ax, 8, loc=1, bbox_to_anchor=(1., 1),
                          bbox_transform=ax.figure.transFigure)
axins.imshow(im, extent=extent, interpolation="nearest",
             origin="upper")

# sub region of the original image
x0, y0, w, h = 0.24, 0.30, 0.05, 0.05
x1, x2, y1, y2 = x0, x0+w, y0, y0+h 

# Clean up ticks and axes
axins.set_xlim(x1, x2)
axins.set_ylim(y1, y2)
axins.yaxis.get_major_locator().set_params(nbins=1)
axins.xaxis.get_major_locator().set_params(nbins=1)
axins.xaxis.set_ticks_position('none')
axins.yaxis.set_ticks_position('none') 
plt.xticks(visible=False)
plt.yticks(visible=False)
ax.axis('off')
for axis in ['top','bottom','left','right']:
    axins.spines[axis].set_linewidth(0.5)
    axins.spines[axis].set_color('k')

# Connect inset lines 
mark_inset(ax, axins, loc1=2, loc2=4, fc="none", ec="0", lw=0.5)

# Save 
fig.savefig('inset.png', dpi=1000, pad_inches=-0.1)
