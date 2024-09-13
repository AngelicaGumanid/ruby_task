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

print "\nInput a National ID: "
add_national_id = gets.chomp.to_i

if persons.any? { |person| person[:national_id] == add_national_id}
  puts "\nFailed to add: National ID already exists."
else
  print "Input name: "
  add_name = gets.chomp

  print "Input age: "
  add_age = gets.chomp.to_i

  persons << {name: add_name, age:add_age, national_id:add_national_id}

  puts "User added successfully!"
end

persons.each do |key, value|
  puts "Information: #{key}, #{value}\n"
end