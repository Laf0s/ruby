File.write("app.conf", <<~CONF)
  # Конфігурація сервісу
    host = localhost  
  port = 5432

    # Налаштування пулу
  pool_size = 10
  timeout = 30.5

  # Логування
  debug = true
     
  # Кінець файлу
CONF

lines_v1 = []
File.foreach("app.conf") do |line|
  cleaned = line.chomp.strip
  next if cleaned.empty? || cleaned.start_with?("#")

  lines_v1 << cleaned
end

lines_v2 = File.open("app.conf", "r") do |file|
  file.readlines
      .map { |l| l.chomp.strip }
      .reject { |l| l.empty? || l.start_with?("#") }
end

puts "Блок 3. Завдання 9"
puts "Спосіб 1 (File.foreach + chomp.strip): #{lines_v1}"
puts "Спосіб 2 (File.open + readlines):     #{lines_v2}\n\n"

File.delete("app.conf") if File.exist?("app.conf")


html_template = "<html><head><title>Звіт {{YEAR}}</title></head><body><h1>Рік: {{YEAR}}</h1><footer>&copy; {{YEAR}} IPZ-33</footer></body></html>"

File.write("template.html", html_template)
File.write("template.html", File.read("template.html").gsub("{{YEAR}}", "2026"))
result_v1 = File.read("template.html")

File.write("template.html", html_template)
content = File.open("template.html", "r", &:read)
updated = content.gsub(/\{\{YEAR\}\}/, "2026")
File.open("template.html", "w") { |f| f.write(updated) }
result_v2 = File.read("template.html")

puts "Блок 3. Завдання 10"
puts "Спосіб 1 (File.write + File.read.gsub):"
puts "  #{result_v1}"
puts "Спосіб 2 (File.open блокова форма):"
puts "  #{result_v2}\n\n"

File.delete("template.html") if File.exist?("template.html")
