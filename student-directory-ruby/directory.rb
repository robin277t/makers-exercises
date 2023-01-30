=begin
students = [
 {name: "Dr. Hannibal Lecter", cohort: :november},
 {name: "Darth Vader", cohort: :november},
 {name: "Nurse Ratched", cohort: :november},
 {name: "Michael Corleone", cohort: :november},
 {name: "Alex DeLarge", cohort: :november},
 {name: "The Wicked Witch of the West", cohort: :november},
 {name: "Terminator", cohort: :november},
 {name: "Freddy Krueger", cohort: :november},
 {name: "The Joker", cohort: :november},
 {name: "Joffrey Baratheon", cohort: :november},
 {name: "Norman Bates", cohort: :november}
 ]
=end 
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(names)
  new_arr = names.uniq.map { |nam| y = nam[:cohort] }
  new_arr.uniq.each do |j| 
      puts "#{j} cohort students:"
      names.each {|c| p c[:name] if c[:cohort] == j}
  end
     # puts names.each {|x| x[:name] if x[:cohort] == y}
     
  #names.each_with_index {|student,idx| puts "#{idx+1}. #{student[:name]} (#{student[:cohort]} cohort)" }
  
end

def print_footer(names)
    names.count == 1 ? str = "student" : str = "students"
    puts "Overall, we have #{names.count} great #{str}".center(50)
    #puts str.methods.sort
end


def input_students
    puts "Please enter the names of the students\nTo finish, just hit return thrice"
    students = []
    name = gets.chomp
    puts "Enter your cohort"
    cohort = gets.strip
    cohort = :jan if cohort.empty?
    while !name.empty? do
       students<<{:name => name, :cohort => cohort}
       puts "Now we have #{students.count} students, enter another name"
       name = gets.chomp
       puts "enter the next cohort"
       cohort = gets.chomp.to_sym
       cohort = :jan if cohort.empty?
    end
    #p students
    return students
end

students = input_students
print_header
print(students)
print_footer(students)
