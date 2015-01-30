# let's put all students into an array
students = [
"Dr. Hannibal Lecter",
"darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex De large",
"The Alien",
"Terminator",
"Freddy Kruger",
"The Joker"]
#and then print them
puts "The students of my cohort at Makers Academy"
puts "------------"

students.each do |student|
	puts student
end

#finally, we print the total
puts "Overall, we have #{students.length} great students"

