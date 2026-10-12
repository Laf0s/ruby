r1 = 100.0
r2 = 150.0

r_total = (r1 * r2) / (r1 + r2)

puts "Завдання 1"
puts "Резистор 1: #{r1} Ом"
puts "Резистор 2: #{r2} Ом"
puts "Еквівалентний опір: #{r_total.round(2)} Ом\n\n"


words = [
  "алгоритм", "мова", "рубі", "функція", "масив",
  "клас", "блок", "пайп", "об'єкт", "термінал"
]

even_words_v1 = words.select { |word| (word.length % 2).zero? }

even_words_v2 = words.filter { |word| word.length.even? }

puts "Завдання 2"
puts "Початкові слова: #{words.inspect}"
puts "Спосіб 1 (select + zero?): #{even_words_v1.inspect}"
puts "Спосіб 2 (filter + even?):  #{even_words_v2.inspect}\n\n"


numbers = [4, 9, 16, 25, 36, 49, 64, 81, 100]

roots_1 = numbers.map { |x| Math.sqrt(x) }

roots_2 = numbers.map(&Math.method(:sqrt))

puts "Завдання 3"
puts "Числа: #{numbers.inspect}"
puts "Спосіб 1 (block):  #{roots_1.inspect}"
puts "Спосіб 2 (method object): #{roots_2.inspect}\n\n"


currencies = [
  { currency: "USD", rate: 41.20, change: 0.15 },
  { currency: "EUR", rate: 44.80, change: -0.05 },
  { currency: "GBP", rate: 53.40, change: 0.35 },
  { currency: "PLN", rate: 10.45, change: -0.02 },
  { currency: "CHF", rate: 46.10, change: 0.08 },
  { currency: "CAD", rate: 30.15, change: 0.00 }
]

growing_v1 = currencies.select { |c| c[:change] > 0 }.sort_by { |c| c[:change] }

growing_v2 = currencies.reject { |c| c[:change] <= 0 }.sort { |a, b| a[:change] <=> b[:change] }

puts "Завдання 4"
puts "Спосіб 1 (select + sort_by)"
growing_v1.each do |c|
  puts "#{c[:currency]}: курс #{c[:rate]} грн (зростання +#{c[:change]})"
end

puts "\nСпосіб 2 (reject + sort <=>)"
growing_v2.each do |c|
  puts "#{c[:currency]}: курс #{c[:rate]} грн (зростання +#{c[:change]})"
end