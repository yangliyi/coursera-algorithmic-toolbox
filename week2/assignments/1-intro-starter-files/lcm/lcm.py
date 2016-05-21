# Uses python3
import sys

def gcd(a, b):
  current_gcd = 1

  if a > b:
    large_one = a
    small_one = b
  else:
    large_one = b
    small_one = a

  if large_one % small_one == 0:
    current_gcd = small_one
    return current_gcd

  while large_one % small_one != 0:
    remainder = large_one % small_one
    large_one = small_one
    small_one = remainder

  current_gcd = small_one

  return current_gcd

def lcm(a, b):
    #write your code here
    current_gcd = 1
    current_gcd = gcd(a, b)
    lcm = (a * b) // current_gcd
    lcm = int(lcm)
    return lcm

if __name__ == '__main__':
    input = sys.stdin.read()
    a, b = map(int, input.split())
    print(lcm(a, b))

# a = int(input())
# b = int(input())
# print(lcm(a,b))
