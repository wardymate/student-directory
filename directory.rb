@students = [] # an empty array accessible to all methods

#let's define our methods

def print_header
puts "The students of my cohort at Makers Academy".center(50)
puts "------------".center(50)
end

def print_students_list
	@students.each_with_index {|student,index| puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50) }
end

def print_footer
	puts "Overall, we have #{@students.length} great students".center(50)
end

def input_students
	puts "Please enter the names of the students".center(50)
	puts "To finish, just hit return twice".center(50)
	#gets the first name
	name = STDIN.gets.chomp
	#While the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		@students << {:name => name, :cohort => :november}
		puts "Now we have 1 student".center(50) if @students.length == 1
		puts "Now we have #{@students.length} students".center(50) if @students.length > 1
		# get another name from the user
		name = STDIN.gets.chomp
	end
	# return the array of students
	@students
end

def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
	print_header
	print_students_list
	print_footer
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
	# open the file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

def load_students(filename = "students.csv")
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(',')
		@students << {:name => name, :cohort => cohort.to_sym}
	end
	file.close
end

def try_load_students
	filename = ARGV.first # first argument from the command line
	return if filename.nil? # get out of the method if it isn't given
	if File.exists?(filename) # if it exhists
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else #if it doesn't exist
		puts "sorry, #{filename} doesn't exist."
		exit # quit the program
	end
end


try_load_students
interactive_menu


