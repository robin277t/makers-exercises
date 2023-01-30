# Write a program that acts like a magic 8 ball.  It should:
# * Randomly choose one of five predictions:
#   * `It is certain`
#   * `It is decidedly so`
#   * `Ask again later`
#   * `Outlook not so good`
#   * `Very doubtful`
# * `puts` the prediction it chose.
# * Example output from running the program several times:
#   $ ruby question_1.rb
#   Ask again later
#   $ ruby question_1.rb
#   Ask again later
#   $ ruby question_1.rb
#   It is certain
random = rand(1..5)
if random == 1
  puts "It is certain"
elsif random == 2
  puts "It is decidedly so"
elsif random == 3
  puts "Ask again later"
elsif random == 4
  puts "Outlook not so good"
else
  puts "Very doubtful"
end
