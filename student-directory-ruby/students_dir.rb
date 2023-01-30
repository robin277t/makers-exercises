@students = []

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
  @students << {:name => name, :cohort => :november}
  puts "Now we have #{@students.count} students"
  name = STDIN.gets.chomp
  end
  return @students
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
        @students << {:name => name, :cohort => cohort.to_sym}
    end
    file.close
end


def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
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
            @students = input_students
        when "2"
            show_students
        when "3"
            save_students
        when "4"
            load_students
        when "9"
            exit
        else 
            puts "I don't know what you meant, try again"
    end
end

def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end



def try_load_students
    filename = ARGV.first
    return if filename.nil?
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