# -*- coding: utf-8 -*-
"""
Created on Tue Jun 30 22:40:35 2020

@author: Mateo
"""

import time

# A function to do some deterministic task:
# Find the n-th Fibbonacci number
def fib(n):
    if n == 0 or n == 1:
        return 1
    else:
        return fib(n-1) + fib(n-2)

# %%
n = 30

start = time.time()
res = list(map(fib, range(n)))
print('Sequential time was {:.{prec}} seconds'.format(time.time()-start, prec = 3))
print(res)