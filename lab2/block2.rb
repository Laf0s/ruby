matrix1 = [
  [12,  5,  3,  8],
  [ 7, 24,  1,  9],
  [ 4,  6, 36,  2],
  [11, 15, 18, 48]
]


n1 = [matrix1.length, matrix1[0].length].min
diag_sum_v1 = 0
k = 0
while k < n1
  diag_sum_v1 += matrix1[k][k]
  k += 1
end
diag_avg_v1 = diag_sum_v1.to_f / n1

diag_elements = (0...n1).map { |i| matrix1[i][i] }
diag_sum_v2 = diag_elements.sum
diag_avg_v2 = diag_sum_v2.to_f / n1

puts "Блок 2. Завдання 11"
puts "Матриця:"
matrix1.each { |row| puts "  #{row}" }
puts "Спосіб 1 (цикл while):      сума = #{diag_sum_v1}, середнє = #{diag_avg_v1.round(2)}"
puts "Спосіб 2 (ітератор map/sum): сума = #{diag_sum_v2}, середнє = #{diag_avg_v2.round(2)}\n\n"


matrix2 = [
  [1, 0, 5, 2],
  [0, 0, 0, 0],
  [3, 4, 0, 1],
  [0, 0, 0, 0],
  [0, 2, 0, 0],
  [0, 0, 0, 0]
]

zero_rows_v1 = []
r = 0
until r >= matrix2.length
  row = matrix2[r]
  all_zero = true
  c = 0
  until c >= row.length
    if row[c] != 0
      all_zero = false
      break
    end
    c += 1
  end
  zero_rows_v1 << r if all_zero && !row.empty?
  r += 1
end

zero_rows_v2 = matrix2.each_with_index.filter_map do |row, row_idx|
  row_idx if row.all?(&:zero?)
end

puts "Блок 2. Завдання 12"
puts "Матриця:"
matrix2.each_with_index { |row, r_idx| puts "  Рядок #{r_idx}: #{row}" }
puts "Спосіб 1 (цикл until):      індекси #{zero_rows_v1} (рядки: #{zero_rows_v1.map { |x| x + 1 }})"
puts "Спосіб 2 (ітератор filter): індекси #{zero_rows_v2} (рядки: #{zero_rows_v2.map { |x| x + 1 }})\n\n"
