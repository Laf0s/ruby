puts "Завдання 1"
def student_info(name, group = "ІПЗ-33")
  "Студент: #{name}, група: #{group}"
end

puts student_info("Андрій")
puts student_info("Олег", "ІПЗ-31")

def student_info(name, group = "ІПЗ-33", course = 3)
  "Студент: #{name}, група: #{group}, курс: #{course}"
end

puts student_info("Андрій")
puts

puts "Завдання 2"
def register(name:, age: nil, city: "Івано-Франківськ")
  info = "Ім'я: #{name}, місто: #{city}"
  info += ", вік: #{age}" if age
  info
end

puts register(name: "Андрій")
puts register(name: "Марк", age: 20, city: "Львів")
puts

puts "Завдання 3"
def passed?(score)
  score >= 50
end

puts "Бал 75 складено? #{passed?(75)}"
puts "Бал 45 складено? #{passed?(45)}"
puts

puts "Завдання 4"
class Grade
  attr_reader :score

  def initialize(score)
    @score = score
  end

  def +(other)
    Grade.new(@score + other.score)
  end

  def score=(new_score)
    @score = new_score.negative? ? 0 : new_score
  end
end

g1 = Grade.new(40)
g2 = Grade.new(35)
total = g1 + g2
puts "Сума балів: #{total.score}"
g1.score = 55
puts "Новий бал g1: #{g1.score}"
puts

puts "Завдання 5"
def average_score(scores)
  (scores.sum.to_f / scores.size).round(2)
end

def list_subjects(*subjects)
  subjects.join(", ")
end

puts "Середній бал: #{average_score([85, 90, 78, 92])}"
puts "Предмети: #{list_subjects('Ruby', 'Бази даних', 'Веб-дизайн')}"
puts

puts "Завдання 6"
def calc_scholarship(base)
  base * 1.5
end

alias stipend calc_scholarship

puts "calc_scholarship: #{calc_scholarship(2000)}"
puts "stipend (псевдонім): #{stipend(2000)}"
puts

puts "Завдання 7"
def format_student(name, &block)
  block.call(name)
end

puts format_student("Андрій") { |n| "Студент: #{n.upcase}" }
puts format_student("Андрій") { |n| "Вітаємо, #{n}!" }
puts

puts "Завдання 8"
def notify
  puts "Повідомлення: #{yield}" if block_given?
end

def evaluate(score)
  puts "Оцінка #{score}: #{yield(score)}" if block_given?
end

notify { "Сесія розпочалась" }
evaluate(95) { |s| s >= 90 ? "Відмінно" : "Добре" }
puts

puts "Завдання 9"
proc_no_args = Proc.new { "Proc без аргументів виконано" }
puts proc_no_args.call

proc_with_args = Proc.new { |a, b| "a: #{a.inspect}, b: #{b.inspect}" }
puts proc_with_args.call(10)
puts proc_with_args.call(10, 20, 30)

def test_proc_return
  pr = Proc.new { return "Результат з Proc (завершує весь метод)" }
  pr.call
  "Кінець методу"
end

puts test_proc_return
puts

puts "Завдання 10"
lambda_no_args = -> { "Lambda без аргументів виконана" }
puts lambda_no_args.call

lambda_with_args = ->(a, b) { "a: #{a}, b: #{b}" }
puts lambda_with_args.call(10, 20)

begin
  lambda_with_args.call(10)
rescue ArgumentError => e
  puts "Помилка аргументів у lambda: #{e.message}"
end

def test_lambda_return
  lm = -> { return "Результат з lambda" }
  val = lm.call
  "Отримано: '#{val}', і метод продовжує виконання"
end

puts test_lambda_return
