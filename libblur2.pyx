
import cython
import numpy as np

@cython.boundscheck(False)  # Deactivate bounds checking
@cython.wraparound(False)   # Deactivate negative indexing
def blur(img: cython.double[:, :], h: cython.int, w: cython.int, k: cython.int) -> cython.double[:, :]:
    h: cython.int; w: cython.int
    i: cython.int; j: cython.int
    di: cython.int; dj: cython.int

    result = np.zeros((h, w), dtype=np.double)
    view: cython.double[:, :] = result

    for i in range(h):
        for j in range(w):
            total: cython.double = 0.0
            num: cython.int = 0
            for di in range(-k,k+1):
                for dj in range(-k,k+1):
                    if 0<=i+di<h and 0<=j+dj<w:
                        total += img[i+di][j+dj]
                        num += 1
            view[i][j] = total/num
    return result
