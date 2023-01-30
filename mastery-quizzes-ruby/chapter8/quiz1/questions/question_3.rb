# Write a program that groups people based on their favourite
# things. In should:
# * Ask the user to input a category - `sport` or `fruit`.
# * Put the `people` into groups where each group has people who share
#   the same favourite thing.
# * Print out the names of the people in each group.  Before each
#   group, it should say which favourite thing the people in the group
#   share.
#
# * Example output:
#   ```
#   Enter category to group people by
#   sport
#   squash
#   Mary
#   Lauren
#   Govind
#   weightlifting
#   Isla
#   Awad
#   cycling
#   Sam
#   Will
#   ```
#
# Note: You can assume that, when asked for a category, the user will
# only enter either `sport` or `fruit`.
people = [
  { "name" => "Mary", "sport" => "squash", "fruit" => "blackberry" },
  { "name" => "Lauren", "sport" => "squash", "fruit" => "orange" },
  { "name" => "Isla", "sport" => "weightlifting", "fruit" => "banana" },
  { "name" => "Sam", "sport" => "cycling", "fruit" => "orange" },
  { "name" => "Govind", "sport" => "squash", "fruit" => "banana" },
  { "name" => "Awad", "sport" => "weightlifting", "fruit" => "kiwi" },
  { "name" => "Will", "sport" => "cycling", "fruit" => "blackberry" }
]
puts "Enter category to group people by"
cat = gets.chomp
list = []
people.each do |hashes|
  val = hashes[cat]
  if list.include? val
    next
  end
  
  puts val
  people.each do |hashes2|
    if hashes2[cat] == val
      puts hashes2["name"]
    end
    list.push val
  end
end
=begin
0. make new blank array
1. loop through people array
2. make a variable that takes the cat key element
2a. check the variable not included in blank_array,
3. puts the variable
4. loops through array and puts the names of everyone with the same variable value
5. adds variable to the new blank array 
=end