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
    find = search.to_i
    person = persons.find { |person| person[:national_id] == find }

  else
    person = persons.find { |person| person[:name].downcase == search.downcase }

  end

  if person
    puts "\nUser found = Name: #{person[:name]}, Age: #{person[:age]}, National ID: #{person[:national_id]}"

  else
    puts "\nUser not found!"

  end

end

# DISPLAY LIST LOGIC UPDATED AND RECENT 5
def display_list(persons)
  puts "\nLIST OF NATIONAL IDs:"

  persons.first(5).each do |person|
    puts "National ID: #{person[:national_id]}, Name: #{person[:name]}, Age: #{person[:age]}"
  end

end

# ==================== MAIN ====================
loop do

  puts "\n=================================================="
  puts "TYPE 'add_user' TO ADD A USER."
  puts "TYPE 'delete_user' TO DELETE A USER."
  puts "TYPE 'search_user' TO SEARCH FOR USER."
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

  elsif choose == "exit"
    puts "\nExisting the program!"
    break

  else
    puts "\nINVALID! PLEASE MAKE SURE YOU TYPE THE CORRECT SPELLING! TRY AGAIN!"

  end

end