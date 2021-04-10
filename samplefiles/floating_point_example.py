#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Feb 23 21:28:18 2021

@author: hboateng
# Floating point arithmetic
"""
import numpy as np
xk=0.1; truexk=[0.2,0.4,0.8,0.6]
print("k   ","   True x_k   ","        Computed x_k")
for i in range(60):
    if xk <= 0.5:
        xk = 2*xk
    else:
        xk = 2*xk-1
    j = np.mod(i,4)
    print(i,"       ",truexk[j],"            ",xk)
