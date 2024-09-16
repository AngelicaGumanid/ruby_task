# ==================== ARRAY ====================
persons =
  [
    { name: "Ahyeon", age: 17, national_id: 041107 },
    { name: "Chastine", age: 23, national_id: 542902 },
    { name: "Ezekielle", age: 25, national_id: 122901 },
    { name: "Andre", age: 25, national_id: 012004 },
    { name: "Justin", age: 25, national_id: 580106 },
    { name: "Emmanuel", age: 25, national_id: 935466 },
    { name: "Alodia", age: 25, national_id: 120545 },
    { name: "Camille", age: 25, national_id: 057745 },
    { name: "Neil", age: 25, national_id: 591601 },
    { name: "Aia", age: 25, national_id: 510498 },
    { name: "Ruka", age: 25, national_id: 012045 },
    { name: "Rora", age: 25, national_id: 124578 },
    { name: "Rami", age: 25, national_id: 557766 },
    { name: "Pharita", age: 25, national_id: 870045 },
    { name: "Chiquita", age: 25, national_id: 467977 },
    { name: "Asa", age: 25, national_id: 760923 },
    { name: "Hanni", age: 25, national_id: 356899 },
    { name: "Jedd", age: 25, national_id: 236497 },
    { name: "Marie", age: 25, national_id: 548790 },
    { name: "Ziana", age: 25, national_id: 4578086 }
  ]

# ==================== DISPLAY ARRAY ====================
def display_list(persons)
  puts "\nLIST OF NATIONAL IDs:"
  persons.each do |person|
    puts "National ID: #{person[:national_id]}, Name: #{person[:name]}, Age: #{person[:age]}"
  end
end

# ==================== ADD USER LOGIC ====================
def add_user(persons)

  print "\nInput a National ID: "
  national_id = gets.chomp.to_i

  if persons.any? { |person| person[:national_id] == national_id }
    puts "\nFailed to add: National ID already exists."
  else
    print "Input name: "
    name = gets.chomp

    print "Input age: "
    age = gets.chomp.to_i

    persons.unshift({ name: name, age: age, national_id: national_id })

    puts "\nUser added successfully!"

    system("clear")

  end

  display_list(persons)
end

# ==================== DELETE USER LOGIC ====================
def delete_user(persons)

  print "\nEnter National ID to delete: "
  national_id = gets.chomp.to_i

  index = persons.find_index { |person| person[:national_id] == national_id }

  if index.nil?
    puts "\nUser not found."
  else
    persons.delete_at(index)
    print "\nSuccessfully deleted."
  end
  display_list(persons)
end

# ==================== SEARCH LOGIC ====================
def search_user(persons)

  print "\nEnter National ID or Name to search: "
  search = gets.chomp

  if search.to_i.to_s == search
    search = search.to_i
    user = persons.find { |person| person[:national_id] == search }
  else
    person = persons.find { |person| person[:name].downcase == search.downcase }
  end

  if user
    puts "\nUser found = Name: #{person[:name]}, Age: #{person[:age]}, National ID: #{person[:national_id]}"
  else
    puts "\nUser not found!"
  end

end

# ==================== DISPLAY LAST 5 USERS ====================
def display_last20(persons)
  puts "\nTHE LAST 5 PERSONS:"
  persons.last(5).each do |person|
    puts "National ID: #{person[:national_id]}, Name: #{person[:name]}, Age: #{person[:age]}"
  end
end

# ==================== MAIN ====================
loop do
  puts "\n=================================================="
  puts "TYPE 'add_user' TO ADD A USER."
  puts "TYPE 'delete_user' TO DELETE A USER."
  puts "TYPE 'search_user' TO SEARCH FOR USER."
  puts "TYPE 'display_last' TO DISPLAY LAST 20 PERSONS IN THE LIST."
  puts "TYPE 'exit' TO EXIT THE PROGRAM."
  puts "=================================================="

  print "What would you like to do, choose above? "
  choose = gets.chomp

  if choose == "add_user"
    add_user(persons)
  elsif choose == "delete_user"
    delete_user(persons)
  elsif choose == "search_user"
    search_user(persons)
  elsif choose == "display_last"
    display_last20(persons)
  elsif choose == "exit"
    puts "\nExisting the program!"
    break
  else
    puts "Invalid!"
  end
end