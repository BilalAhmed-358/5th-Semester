import numpy as np
from numpy.core.numeric import cross

def findMaxCrossingSubarray(A,lo,hi,mid):
    right_sum = float('-inf')
    left_sum = float('-inf')
    sum = 0
    i=mid
    while i >= lo:
        sum = sum + A[i]
        if sum > left_sum:
            left_sum = sum
            max_left = i
        else:
            sum -= A[i]
        i = i-1
        print('index ', i+1, 'elemenet ', A[i], 'left mid sum ', left_sum, sep = ' ')
    
    sum = 0
    i= mid+1
    while i<=hi:
        sum = sum + A[i]
        if sum > right_sum:
            right_sum = sum 
            max_right = i
        else:
            sum -= A[i]
        i= i+1
        print('index ', i-1, 'elemenet ', A[i], 'right mid sum ', right_sum, sep = ' ')

    print('total sum ', left_sum+right_sum)
    return max_left, max_right, left_sum+right_sum

def findMaxSubArray(A, lo,hi):
    if (lo==hi):
        # print(lo, hi, A[lo], sep=' ')
        return (lo, hi, A[lo])
    else:
        mid = np.floor((lo+hi)/2)
        mid = int(mid)
        left_low, left_high,left_sum = findMaxSubArray(A,lo,mid)
        right_low, right_high, right_sum = findMaxSubArray(A,mid+1,hi)
        cross_low, cross_high, cross_sum = findMaxCrossingSubarray(A,lo,hi,mid)

        if left_sum >= right_sum and left_sum >= cross_sum:
            print ('left sum : ', left_sum)
            return left_low, left_high, left_sum
        elif right_sum>= left_sum and right_sum >= cross_sum:
            print ('right sum : ', right_sum)
            return right_low, right_high, right_sum
        else:
            print ('cross sum : ', cross_sum)
            return cross_low, cross_high, cross_sum
        
A = [-2,-5,6,-2,-3,1,5,-6]

low, high, sum = findMaxSubArray(A, 0, len(A))
while low <= high:
    print(A[low])
    low = low+1
