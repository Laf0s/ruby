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

even_words = words.select { |word| (word.length % 2).zero? }

puts "Завдання 2"
puts "Початкові слова: #{words.inspect}"
puts "Слова парної довжини: #{even_words.inspect}\n\n"


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

growing = currencies.select { |c| c[:change] > 0 }.sort_by { |c| c[:change] }

puts "Завдання 4"
puts "Валюти, що зросли в ціні:"
growing.each do |c|
  puts "#{c[:currency]}: курс #{c[:rate]} грн (зростання +#{c[:change]})"
end