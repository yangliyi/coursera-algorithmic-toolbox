# Uses python3
import sys

# def get_fibonacci_last_digit(n):
#     # write your code here
#     return 0

# if __name__ == '__main__':
#     input = sys.stdin.read()
#     n = int(input)
#     print(get_fibonacci_last_digit(n))

def get_fibonacci_last_digit(n):
    # write your code here
    # Uses python3
    if (n <= 1):
        return n

    else:
        arr = []
        arr.append(0)
        arr.append(1)
        for i in range(2, n+1):
            arr.append((arr[i-1] + arr[i-2]) % 10 )
        return arr[n]

# if __name__ == '__main__':
#     input = sys.stdin.read()
n = int(input())
print(get_fibonacci_last_digit(n))
