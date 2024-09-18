# ==================== PERSON CLASS ====================
class Person
  attr_accessor :mame, :age, :national_id

 def initialize(name, age, national_id)
 @name = name
 @age = age
 @national_id = national_id
 end

def to_s
  "National ID: #{@national_id}, Name:: #{@name}, Age:: #{@age}"
end
end

# ==================== ARRAY ====================
persons =
  [
    Person.new("Ahyeon", 17, 41107 ),
    Person.new( "Chastine", 23, 42902 ),
    Person.new( "Ezekielle", 25, 12201 ),
    Person.new( "Andre", 25, 12004 ),
    Person.new( "Justin", 25, 58106 ),
    Person.new( "Emmanuel", 25, 93546 ),
    Person.new( "Alodia", 25, 12045 ),
    Person.new( "Camille", 25, 57745 ),
    Person.new( "Neil", 25, 59161 ),
    Person.new( "Aia", 25, 51098 ),
    Person.new( "Ruka",25, 12045 ),
    Person.new( "Rora", 25, 12478 ),
    Person.new( "Rami", 25, 55776 ),
    Person.new( "Pharita", 25, 87045 ),
    Person.new( "Chiquita",25, 47977 ),
    Person.new( "Asa", 25, 76923 ),
    Person.new( "Hanni", 25, 356809 ),
    Person.new( "Jedd",25, 23697 ),
    Person.new( "Marie", 25, 54870 ),
    Person.new( "Ziana", 25, 457808 )

  ]

# ==================== ADD USER LOGIC ====================
def add_user(persons)

  print "\nInput a National ID: "
  national_id = gets.chomp.to_i

  if persons.any? { |person| person.national_id == national_id }
    puts "\nFailed to add: National ID already exists."
  else
    print "Input name: "
    name = gets.chomp

    print "Input age: "
    age = gets.chomp.to_i

    persons.unshift(Person.new(name, age, national_id ))
    puts "\nUser added successfully!"
  end

  display_list(persons)
  system("clear")
end

# ==================== DELETE USER LOGIC ====================
def delete_user(persons)

  print "\nEnter National ID to delete: "
  national_id = gets.chomp.to_i

  index = persons.find_index { |person| person.national_id == national_id }

  if index
    puts "\nUser not found."
  else
    persons.delete_at(index)
    print "\nSuccessfully deleted."
  end

  display_list(persons)
  system("clear")
end

# ==================== SEARCH LOGIC ====================
def search_user(persons)

  print "\nEnter National ID or Name to search: "
  search = gets.chomp

  person = if search =~ /^\d+$/
    persons.find { |person| person.national_id == search.to_i }
  else
    persons.find { |person| person.name.casecmp == (search).zero? }
  end

  if person
    puts "\nUser found = Name: #{person.name}, Age: #{person.age}, National ID: #{person.national_id}"
  else
    puts "\nUser not found!"
  end

  system("clear")
end

# ==================== EDIT USER LOGIC ====================
def edit_user(persons)

  print "\nEnter National ID of the user to edit: "
  national_id = gets.chomp.to_i

  user_index = persons.find_index { |person| person.national_id == national_id}

  if user_index
    user = persons[user_index]

    puts "\n=================================================="
    print "\nEDIT USER DETAILS \nNAME:#{user.name} \nAGE:#{user.age}\n"
    puts "\n=================================================="

    print "\nEnter new name (or press Enter to keep '#{user[:name]}}'): "
    new_name = gets.chomp
    new_name = new_name ? user.name : new_name

    print "Enter new age (or press Enter to keep '#{user[:age]}'): "
    input_age = gets.chomp.to_i
    new_age = input_age ? user.age : input_age.to_i

    user.name = new_name
    user.age = new_age
    persons.delete_at(user_index)
    persons.unshift(user)

    puts "\n=================================================="
    puts "\nUSER UPDATED SUCCESSFULLY"
    print "NAME:#{user.name}\n"
    print "AGE:#{user.age}"
    puts "\n=================================================="

  else
    puts "\nUser not found!."
  end

  display_list(persons)
  system("clear")

end

# DISPLAY LIST LOGIC UPDATED AND RECENT 5
def display_list(persons)
  puts "\nLIST OF NATIONAL IDs:"

  persons.first(5).each do |person|
    puts person
  end

end

# ==================== MAIN ====================
loop do

  system("clear")

  puts "\n=================================================="
  puts "TYPE 'add_user' TO ADD A USER."
  puts "TYPE 'delete_user' TO DELETE A USER."
  puts "TYPE 'search_user' TO SEARCH FOR USER."
  puts "TYPE 'edit_user' TO EDIT THE USER DETAIL."
  puts "TYPE 'exit' TO EXIT THE PROGRAM."
  puts "=================================================="

  print "What would you like to do, choose above? "
  choose = gets.chomp

  case choose
  when "add_user"
    add_user(persons)
  when "delete_user"
    delete_user(persons)
  when "search_user"
    search_user(persons)
  when "edit_user"
    edit_user(persons)
  when "exit"
    print "\nAre you sure you want to exit (y/n)? "
    action = gets.chomp
    puts "\nEXISTING THE PROGRAM!"
    break if action.downcase == y
  else
    puts "\nINVALID! PLEASE MAKE SURE YOU TYPE THE CORRECT SPELLING! TRY AGAIN!"
  end
end