# Uses python3
n = int(input())
a = [int(x) for x in input().split()]
assert(len(a) == n)

result = 0

a.sort()

result = a[n-2]*a[n-1]

print(result)