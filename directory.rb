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
puts "The students of my cohort at Makers Academy/n"
puts "------------"
end

def print(students)
	students.each_with_index {|student,index| puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer (names)
	puts "Overall, we have #{names.length} great students"
end

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# create and empty array
	students = []
	#gets the first name
	name = gets.chomp
	#While the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {:name => name, :cohort => :november}
		puts "Now we have #{students.length} students"
		# get another name from the user
		name = gets.chomp
	end
	# return the array of students
	students
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)


