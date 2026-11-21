admin = User.find_or_create_by!(email: "admin@example.com") do |u|
  u.name = "Адміністратор"
  u.password = "password123"
  u.password_confirmation = "password123"
  u.role = :admin
end

regular_user = User.find_or_create_by!(email: "user@example.com") do |u|
  u.name = "Андрій Яцишин"
  u.password = "password123"
  u.password_confirmation = "password123"
  u.role = :user
end

[
  { name: "Бобік", species: "Собака", age: 3, status: "Шукають дім", description: "Спокійний пес, звиклий до повідця та прогулянок.", user: regular_user, photo: "bobik.jpg" },
  { name: "Мурка", species: "Кіт", age: 2, status: "Шукають дім", description: "Домашня кішка, щеплена та привчена до лотка.", user: regular_user, photo: "murka.jpg" },
  { name: "Барон", species: "Собака", age: 5, status: "Шукають дім", description: "Охоронний пес, добре знає базові команди.", user: admin },
  { name: "Луна", species: "Кіт", age: 1, status: "Шукають дім", description: "Грайливе кошеня, любить увагу та іграшки.", user: regular_user },
  { name: "Рекс", species: "Собака", age: 4, status: "Влаштовані", description: "Переданий у нову дружню сім'ю цього місяця.", user: admin },
  { name: "Сімба", species: "Кіт", age: 3, status: "Влаштовані", description: "Живе у нових господарів у місті Івано-Франківськ.", user: regular_user },
  { name: "Джессі", species: "Собака", age: 2, status: "Влаштовані", description: "Знайшла люблячий дім минулого тижня.", user: admin },
  { name: "Сніжок", species: "Кіт", age: 1, status: "Потрібна допомога", description: "Потрібен плановий огляд ветеринара та вітаміни.", user: regular_user, photo: "snizhok.jpg" },
  { name: "Том", species: "Кіт", age: 6, status: "Потрібна допомога", description: "Потрібен спеціальний лікувальний корм для відновлення.", user: admin },
  { name: "Альма", species: "Собака", age: 4, status: "Потрібна допомога", description: "Проходить курс реабілітації після травми лапи.", user: admin }
].each do |attrs|
  photo = attrs.delete(:photo)
  animal = Animal.find_or_create_by!(name: attrs[:name]) do |a|
    a.assign_attributes(attrs)
  end

  if photo && !animal.image.attached?
    image_path = Rails.root.join("db/seeds/images", photo)
    if File.exist?(image_path)
      animal.image.attach(io: File.open(image_path), filename: photo, content_type: "image/jpeg")
    end
  end
end
