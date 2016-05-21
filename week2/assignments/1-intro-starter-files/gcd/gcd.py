# Uses python3
import sys

# def gcd(a, b):
#     current_gcd = 1
#     for d in range(2, min(a, b) + 1):
#         if a % d == 0 and b % d == 0:
#             if d > current_gcd:
#                 current_gcd = d

#     return current_gcd

# if __name__ == "__main__":
#     input = sys.stdin.read()
#     a, b = map(int, input.split())
#     print(gcd(a, b))

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


if __name__ == "__main__":
  input = sys.stdin.read()
  a, b = map(int, input.split())
  print(gcd(a, b))