persons =
  [
    {name: "Ahyeon", age: 17, national_id: 00001},
    {name: "Chastine", age: 23, national_id: 805973462},
    {name: "Ezekielle", age: 25, national_id: 309745326},
    {name: "Andre", age: 25, national_id: 49245678},
    {name: "Justin", age: 25, national_id: 47836574},
    {name: "Emmanuel", age: 25, national_id: 469549},
    {name: "Alodia", age: 25, national_id: 4944474},
    {name: "Camille", age: 25, national_id: 97845215},
    {name: "Neil", age: 25, national_id: 49722657},
    {name: "Aia", age: 25, national_id: 14864116},
    {name: "Ruka", age: 25, national_id: 45345354},
    {name: "Rora", age: 25, national_id: 87678673},
    {name: "Rami", age: 25, national_id: 4123457},
    {name: "Pharita", age: 25, national_id: 37864378},
    {name: "Chiquita", age: 25, national_id: 783672374},
    {name: "Asa", age: 25, national_id: 3453487},
    {name: "Hanni", age: 25, national_id: 737783732},
    {name: "Jedd", age: 25, national_id: 11654631},
    {name: "Marie", age: 25, national_id: 4537837},
    {name: "Ziana", age: 25, national_id: 737378347},
  ]

# DISPLAY ARRAY
persons.each do |key, value|
  puts "Information: #{key}, #{value}\n"
end

# ADD USER LOGIC
def add_user(persons)
  print "\nInput a National ID: "
  add_national_id = gets.chomp.to_i

  if persons.any? { |person| person[:national_id] == add_national_id}
    puts "\nFailed to add: National ID already exists."
  else
    print "Input name: "
    add_name = gets.chomp

    print "Input age: "
    add_age = gets.chomp.to_i

    persons.unshift({name: add_name, age:add_age, national_id:add_national_id})

    puts "\nUser added successfully!"
  end

  display_list(persons)
end

# DELETE USER LOGIC
def delete_user(persons)
  print "\nEnter National ID to delete: "
  del_national_id = gets.chomp.to_i

  index = persons.find_index { |person| person[:national_id] == del_national_id}

  if index.nil?
    puts "\nUser not found."
  else
    persons.delete_at(index)
    print "\nSuccessfully deleted."
  end
  display_list(persons)
end

# DISPLAY LIST LOGIC
def display_list(persons)
  puts "\nUpdate list of National ID List: "
  persons.each {|person|puts person}
end

# DISPLAY LAST 20 USER
def display_last20(persons)
  puts "\nTHE LAST 20 PERSONS: "
  persons.last(20).each { |person| puts person}
end

# MAIN
loop do
  puts "\n=================================================="
  puts "TYPE 'add_user' TO ADD A USER."
  puts "TYPE 'delete_user' TO DELETE A USER."
  puts "TYPE 'display_last' TO DISPLAY LAST 20 PERSONS IN THE LIST."
  puts "TYPE 'exit' TO EXIT THE PROGRAM."
  puts "=================================================="

  print "What would you like to do, choose above? "
  choose = gets.chomp

  if choose == "add_user"
    add_user(persons)
  elsif choose == "delete_user"
    delete_user(persons)
  elsif choose == "display_last"
    display_last20(persons)
  elsif choose == "exit"
    puts "\nExisting the program!"
    break
  else
    puts "Invalid!"
  end
end