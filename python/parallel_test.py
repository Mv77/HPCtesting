# -*- coding: utf-8 -*-
"""
Created on Tue Jun 30 22:40:35 2020

@author: Mateo
"""

import numpy as np
import multiprocessing as mp
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

def main():
    
    n = 500
    size = 200
    
    # Parallel
    ##########
    
    cores = mp.cpu_count()
    print('There are {:} threads available'.format(cores, prec = 0))
    
    test_fun(size)
    start = time.time()
    # Create pool
    pool = mp.Pool(mp.cpu_count())
    # Apply the function n times in parallel
    res = pool.map(test_fun, [size for i in range(n)])
    # Terminate cluster
    pool.close()
    print('Parallel time was {:.{prec}} seconds'.format(time.time()-start, prec = 3))
    
    # Sequential
    ############
    
    start = time.time()
    res = list(map(test_fun, [size for i in range(n)]))
    print('Sequential time was {:.{prec}} seconds'.format(time.time()-start, prec = 3))

if __name__ == '__main__':
    main()