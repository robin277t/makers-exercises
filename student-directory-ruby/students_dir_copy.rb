@students = []

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
  insertion(name)
  puts "Now we have #{@students.count} students"
  name = STDIN.gets.chomp
  end
  return @students
end

def insertion(x,y = :november)
     @students << {:name => x, :cohort => y.to_sym}
end

def load_students(filename = "students.csv")
    File.open(filename, "r") do |f| 
        f.readlines.each do |line|
            name, cohort = line.chomp.split(',')
            insertion(name, cohort)
        end
    end
end


def print_header
  puts "The students of my cohort at Makers Academy\n-------------"
end

def print_student_list(names)
  names.each {|stu| puts "#{stu[:name]} (#{stu[:cohort]} cohort)"}
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save students to file"
    puts "4. Load students from file"
    puts "9. Exit"
end

def show_students
    print_header
    print_student_list(@students)
    print_footer(@students)
end

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def process(selection)
    case selection
        when "1"
            puts "you chose 1"
            @students = input_students
        when "2"
            puts "you chose 2"
            show_students
        when "3"
            puts "you chose 3"
            save_students
        when "4"
            puts "you chose 4"
            load_students
        when "9"
            puts "you have successfully exited the app"
            exit
        else 
            puts "I don't know what you meant, try again"
    end
end

def save_students
    File.open("students.csv", "w") do |f|
        @students.each do |student|
            student_data = [student[:name], student[:cohort]]
            csv_line = student_data.join(",")
            f.puts csv_line
        end
    end
end

def try_load_students
    filename = ARGV.first
    filename = "students.csv" if filename.nil?
    if File.exist?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else
        puts "Sorry, #{filename} doesn't exist."
        exit
    end
end    

try_load_students
interactive_menu