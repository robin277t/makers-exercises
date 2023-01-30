# Write a program that adds together all the integers from `1` to
# `250` (inclusive) and `puts`es the total.
n = 1
ans = 0
while n < 251 do
  ans = ans + n
  n += 1
end
puts ans
