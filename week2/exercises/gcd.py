def naive_gcd():
  a = int(input())
  b = int(input())

  max_d = int(max([a/2 ,b/2]))

  gcd = 0

  for i in range(1,max_d):
    if (a % i == 0) & (b % i == 0):
      gcd = i

  return gcd

print(naive_gcd());

