# -*- coding: utf-8 -*-
"""
Created on Tue Jun 30 22:40:35 2020

@author: Mateo
"""

import numpy as np
import time

# A function to do some task
def test_fun(size):
    
    # Create some size*size matrix spd matrix
    mat = np.random.normal(size = (size,size))
    # Get the inverse
    inv = np.linalg.inv(np.dot(mat, mat.T))
    # And store the sum of its elements
    res = np.sum(inv)
        
    return res

# %%

n = 5000
size = 200

start = time.time()
res = list(map(test_fun, [size for i in range(n)]))
print('Sequential time was {:.{prec}} seconds'.format(time.time()-start, prec = 3))