#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Nov 22 15:32:23 2022

@author: kiuruola
"""

import numpy as np
import matplotlib.pyplot as plt
from matplotlib import rc

#For nicer fonts
rc("mathtext", fontset = "cm", rm = "cm")
rc('text', usetex='true')
font = {"fontname": "cm"}

#import data
data = np.genfromtxt("output.dat")

n = len(data[0,:])

#Choose a fitting label, or create your own with the same format.

#labels = [r"$\mathrm{Sun}$", r"$\mathrm{Jupiter}$"]
#labels = [r"$\mathrm{Earth}$", r"$\mathrm{Moon}$"]
#labels = [r"$\mathrm{Sun}$", r"$\mathrm{Earth}$"]
labels = [r"$\mathrm{Sun}$", r"$\mathrm{Mercury}$", r"$\mathrm{Venus}$", r"$\mathrm{Earth}$", r"$\mathrm{Mars}$",
          r"$\mathrm{Jupiter}$", r"$\mathrm{Saturn}$", r"$\mathrm{Uranus}$", r"$\mathrm{Neptune}$"]

#labels = [r"$\mathrm{Sun}$", r"$\mathrm{Mercury}$", "", "", "",
#          "", "", "", ""]

plt.figure(figsize=(5,5)) 
for i in range(n):
    x = data[::3,i]
    y = data[1::3,i]
    plt.plot(x,y, label = labels[i])
    
plt.xlabel(r"$x$ $\mathrm{(au)}$", fontsize = 16)
plt.ylabel(r"$y$ $\mathrm{(au)}$", fontsize = 16)

plt.xticks(fontsize = 14)
plt.yticks(fontsize = 14)

#Limits for the x and y values
#plt.xlim(-0.00025,0.01025)
#plt.ylim(-0.00525, 0.00525)

#You can change the position of the legend here
plt.legend(fontsize = 16, loc = "upper left")
plt.show()