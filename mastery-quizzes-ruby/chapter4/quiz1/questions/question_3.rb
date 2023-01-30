# Write a program that:
# * Calculates the first 20 Fibonacci numbers.
#   * The first Fibonacci number is 0.
#   * The second Fibonacci number is 1.
#   * Every Fibonacci number after that is calculated by adding the
#     previous two Fibonacci numbers together e.g. the third Fibonacci
#     number is the result of `0 + 1`.
# * `puts`es these numbers, one per line.
counter = 3
fib_0 = 0
fib_1 = 1
puts 0
puts 1
while counter < 21 do
  fib_x = fib_0 + fib_1
  puts fib_x
  counter += 1
  fib_0 = fib_1
  fib_1 = fib_x
end
