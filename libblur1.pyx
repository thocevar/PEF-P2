
import numpy as np

def blur(img, h, w, k):
    result = np.zeros((h, w), dtype=np.double)
    for i in range(h):
        for j in range(w):
            total, num = 0.0, 0
            for di in range(-k,k+1):
                for dj in range(-k,k+1):
                    if 0<=i+di<h and 0<=j+dj<w:
                        total += img[i+di][j+dj]
                        num += 1
            result[i][j] = total/num
    return result
