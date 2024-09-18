class person
  attr_accessor :name, :age, :national_id
  @@records = []

  def initialize(name, age, national_id)
    @name = name
    @age = age
    @national_id = national_id
  end

  def save
    @@records << self
  end

  def self.all
    @@records
  end

  def self.first
    @@records.first
  end

  def self.last
    @@records.last
  end

  def display
    print "Name: #{name}, Age: #{age}, National ID: #{national_id}"
  end

  def self.find_by_national_id(national_id)
    @@records.find { |person| person.national_id == national_id }
  end

  def update(name: nil, age: nil)
    @name = name if name
    @age = age if age
  end

  def destroy
    @@records.delete(self)
  end

  def self.destroy_all
    @@records.clear
  end

  def self.count
    @@records.size
  end
end

# ==================== ARRAY ====================
persons =
  [
    { name: "Ahyeon", age: 17, national_id: 41107 },
    { name: "Chastine", age: 23, national_id: 42902 },
    { name: "Ezekielle", age: 25, national_id: 12201 },
    { name: "Andre", age: 25, national_id: 12004 },
    { name: "Justin", age: 25, national_id: 58106 },
    { name: "Emmanuel", age: 25, national_id: 93546 },
    { name: "Alodia", age: 25, national_id: 12045 },
    { name: "Camille", age: 25, national_id: 57745 },
    { name: "Neil", age: 25, national_id: 59161 },
    { name: "Aia", age: 25, national_id: 51098 },
    { name: "Ruka", age: 25, national_id: 12045 },
    { name: "Rora", age: 25, national_id: 12478 },
    { name: "Rami", age: 25, national_id: 55776 },
    { name: "Pharita", age: 25, national_id: 87045 },
    { name: "Chiquita", age: 25, national_id: 47977 },
    { name: "Asa", age: 25, national_id: 76923 },
    { name: "Hanni", age: 25, national_id: 35689 },
    { name: "Jedd", age: 25, national_id: 23697 },
    { name: "Marie", age: 25, national_id: 54870 },
    { name: "Ziana", age: 25, national_id: 457808 }
  ]

# ==================== POPULATING @@records ====================
  persons.each do |person|
    person = Person,new(person[:name], person[:age], person[:national_id])
    person.save
  end

# ==================== ADD USER LOGIC ====================
def add_user
  print "\nInput a National ID: "
  national_id = gets.chomp.to_i

  if Person.find_by_national_id(national_id)
    puts "\nFailed to add: National ID already exists."
  else
    print "Input name: "
    name = gets.chomp
    print "Input age: "
    age = gets.chomp.to_i
    #persons.unshift({ name: name, age: age, national_id: national_id })
    person = Person.new(name, age, national_id)
    person.save
    puts "\nUser added successfully!"
  end

  display_list
  system("clear")
end

# ==================== DELETE USER LOGIC ====================
def delete_user

  print "\nEnter National ID to delete: "
  national_id = gets.chomp.to_i
  person = Person.find_by_national_id(national_id)

  if person
    person.destroy
    print "\nSuccessfully deleted."
  else
    puts "\nUser not found."
  end

  display_list
  system("clear")
end

# ==================== SEARCH LOGIC ====================
def search_user
  print "\nEnter National ID or Name to search: "
  search = gets.chomp

  person = if search =~ /^\d+$/
    Person.find_by_national_id(search.to_i)
  else
    Person.all.find { |person| person.name.casecmp(search).zero? }
  end

  if person
    puts "\nUser found = Name: #{person.name}, Age: #{person.age}, National ID: #{person.national_id}"
  else
    puts "\nUser not found!"
  end

  system("clear")
end

# ==================== EDIT USER LOGIC ====================
def edit_user
  print "\nEnter National ID of the user to edit: "
  national_id = gets.chomp.to_i
  person = Person.find_by_national_id(national_id)

  if person
    puts "\n=================================================="
    print "\nEDIT USER DETAILS \nNAME:#{user.name} \nAGE:#{user.age}\n"
    puts "\n=================================================="

    print "\nEnter new name (or press Enter to keep '#{user.name}'): "
    new_name = gets.chomp
    new_name = new_name.empty? ? person.name : new_name

    print "Enter new age (or press Enter to keep '#{user[:age]}'): "
    input_age = gets.chomp.to_i
    new_age = input_age.empty? ? person.age : input_age.to_i

    person.update(name: new_name, age: new_age)

    puts "\n=================================================="
    puts "\nUSER UPDATED SUCCESSFULLY"
    #print "NAME:#{person.name}"
    #print "NAME:#{person.name}\n"
    #print "AGE:#{person.age}"
    person.display
    puts "\n=================================================="
  else
    puts "\nUser not found!."
  end

  display_list
  system("clear")
end

# DISPLAY LIST LOGIC UPDATED AND RECENT 5
def display_list
  puts "\nLIST OF NATIONAL IDs:"
  Person.all.first(5).each do |person|
    puts "National ID: #{person.national_id}, Name: #{person.name}, Age: #{person.age}"
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

  if choose == "add_user"
    add_user
  elsif choose == "delete_user"
    delete_user
  elsif choose == "search_user"
    search_user
  elsif choose == "edit_user"
    edit_user
  elsif choose == "exit"
    print "\nAre you sure you want to exit (y/n)? "
    action = gets.chomp

    if action == "y"
      puts "\nEXISTING THE PROGRAM!"
      break
    end
    
  else
    puts "\nINVALID! PLEASE MAKE SURE YOU TYPE THE CORRECT SPELLING! TRY AGAIN!"
  end
end