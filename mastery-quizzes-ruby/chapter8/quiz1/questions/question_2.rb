# Write a program that lists the names of people who all like a
# specific thing. It should:
# * Ask the user to input a category - `sport` or `fruit`.
# * Ask the user to input a category value e.g. `kiwi`.
# * `puts` the names of each of the people who like the thing in the
#   category, one per line.
#
# * Example output:
#   ```
#   Enter what category to search
#   sport
#   Enter what value to search for
#   squash
#   Mary
#   Lauren
#   Govind
#   ```
#
# Note: You can assume that, when asked for a category, the user will
# only enter either `sport` or `fruit`.  The user might enter a
# category value that no person has (e.g. `mango`).

people = [
  { "name" => "Mary", "sport" => "squash", "fruit" => "blackberry" },
  { "name" => "Lauren", "sport" => "squash", "fruit" => "orange" },
  { "name" => "Isla", "sport" => "weightlifting", "fruit" => "banana" },
  { "name" => "Sam", "sport" => "cycling", "fruit" => "orange" },
  { "name" => "Govind", "sport" => "squash", "fruit" => "banana" },
  { "name" => "Awad", "sport" => "weightlifting", "fruit" => "kiwi" },
  { "name" => "Will", "sport" => "cycling", "fruit" => "blackberry" }
]
puts "Enter what category to search for"
cat = gets.chomp
puts "Enter what value to search for"
val = gets.chomp
people.each do |p|
  p.each do |x, y|
    if cat == x && val == y
      puts p["name"]
    end
  end
end
=begin
1 - loop through array |a|
2 - loop within array through hash |x,y|
2 - if test of cat and val to x and y, puts out key[0] if there's a match
=end