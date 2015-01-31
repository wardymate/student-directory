@students = [] # an empty array accessible to all methods

# let's put all students into a hash
students = [
{:name => "Dr. Hannibal Lecter", :cohort => :november},
{:name => "Darth Vader", :cohort => :november},
{:name => "Nurse Ratched", :cohort => :november},
{:name => "Michael Corleone", :cohort => :november},
{:name => "Alex De large", :cohort => :november},
{:name => "The Alien", :cohort => :november},
{:name => "Terminator", :cohort => :november},
{:name => "Freddy Kruger", :cohort => :november},
{:name => "The Joker", :cohort => :november},
]

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
	name = gets.chomp
	#While the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		@students << {:name => name, :cohort => :november}
		puts "Now we have 1 student".center(50) if @students.length == 1
		puts "Now we have #{@students.length} students".center(50) if @students.length > 1
		# get another name from the user
		name = gets.chomp
	end
	# return the array of students
	@students
end

def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
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
		when "9"
			exit
		else
			puts "I don't know what you meant, try again"
	end
end	


interactive_menu


