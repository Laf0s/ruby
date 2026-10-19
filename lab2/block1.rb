numbers = [14, 3, 27, 8, 19, 42, 5, 31, 10, 22]

sum = 0
i = 0
while i < numbers.length
  sum += numbers[i]
  i += 1
end
average = sum.to_f / numbers.length

greater_v1 = []
for x in numbers
  greater_v1 << x if x > average
end

avg_iter = numbers.sum.to_f / numbers.size
greater_v2 = numbers.select { |x| x > avg_iter }

puts "Блок 1. Завдання 5"
puts "Початковий масив: #{numbers}"
puts "Середнє арифметичне: #{average.round(2)}"
puts "Спосіб 1 (керуючі конструкції): #{greater_v1}"
puts "Спосіб 2 (ітератор select):     #{greater_v2}\n\n"


arr = [10, 3, 8, 5, 12, 7, 14, 21, 6]
first_elem = arr.first
last_elem = arr.last

modified_v1 = arr.dup
idx = 1
while idx < modified_v1.length - 1
  if modified_v1[idx].even?
    modified_v1[idx] += first_elem
  else
    modified_v1[idx] += last_elem
  end
  idx += 1
end

modified_v2 = arr.map.with_index do |val, index|
  if index.zero? || index == arr.length - 1
    val
  elsif val.even?
    val + first_elem
  else
    val + last_elem
  end
end

puts "Блок 1. Завдання 6"
puts "Початковий масив: #{arr}"
puts "Перший: #{first_elem}, останній: #{last_elem}"
puts "Спосіб 1 (керуючі конструкції): #{modified_v1}"
puts "Спосіб 2 (ітератор map):        #{modified_v2}\n\n"
