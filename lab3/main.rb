menu = {
  "Борщ" => 120,
  "Чай" => 35,
  "Піца" => 220,
  "Суп" => 0,
  "Салат" => 140,
  "Сік" => 45,
  "Стейк" => 350,
  "Деруни" => 110,
  "Вода" => 0,
  "Паста" => 180
}

puts "Завдання 1"
menu.each { |dish, price| puts "#{dish}: #{price} грн" }
puts

puts "Завдання 2"
indexed_menu = menu.to_a
p indexed_menu
puts

puts "Завдання 3"
print "Сортувати за (1 - назвою, 2 - ціною): "
sort_choice = gets.chomp.to_i

sorted_menu = case sort_choice
              when 1 then menu.sort_by { |dish, _| dish }.to_h
              when 2 then menu.sort_by { |_, price| price }.to_h
              else menu.sort.to_h
              end

sorted_menu.each { |dish, price| puts "#{dish} => #{price} грн" }
puts

puts "Завдання 4"
shortest = menu.min_by(3) { |dish, _| dish.length }
shortest.each { |dish, price| puts "#{dish} (#{dish.length} симв.) - #{price} грн" }
puts

puts "Завдання 5"
cheapest_5 = menu.select { |_, price| price.positive? }.sort_by { |_, price| price }.first(5)
cheapest_5.each { |dish, price| puts "#{dish}: #{price} грн" }
puts

puts "Завдання 6"
print "Введіть назву страви: "
search_name = gets.chomp

if menu.key?(search_name)
  puts "#{search_name}: #{menu[search_name]} грн"
else
  puts "Страву '#{search_name}' не знайдено"
end
puts

puts "Завдання 7"
total = menu.values.sum
puts "Загальна вартість: #{total} грн"
puts

puts "Завдання 8"
menu.each do |dish, price|
  unless price&.positive?
    print "Введіть ціну для '#{dish}': "
    input = gets&.chomp
    parsed_price = input.to_i
    menu[dish] = parsed_price.positive? ? parsed_price : 100
  end
end

puts "\nОновлене меню:"
menu.each { |dish, price| puts "#{dish}: #{price} грн" }
