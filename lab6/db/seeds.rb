[
  { name: "Бобік", species: "Собака", age: 3, status: "Шукають дім", description: "Спокійний пес, звиклий до повідця." },
  { name: "Мурка", species: "Кіт", age: 2, status: "Шукають дім", description: "Домашня кішка, щеплена." },
  { name: "Барон", species: "Собака", age: 5, status: "Шукають дім", description: "Охоронний пес, знає базові команди." },
  { name: "Луна", species: "Кіт", age: 1, status: "Шукають дім", description: "Грайливе кошеня, привчене до лотка." },
  { name: "Рекс", species: "Собака", age: 4, status: "Влаштовані", description: "Переданий у нову сім'ю." },
  { name: "Сімба", species: "Кіт", age: 3, status: "Влаштовані", description: "Живе у нових господарів у Івано-Франківську." },
  { name: "Джессі", species: "Собака", age: 2, status: "Влаштовані", description: "Знайшла дім минулого тижня." },
  { name: "Сніжок", species: "Кіт", age: 1, status: "Потрібна допомога", description: "Потрібен огляд ветеринара." },
  { name: "Том", species: "Кіт", age: 6, status: "Потрібна допомога", description: "Потрібен спеціальний лікувальний корм." },
  { name: "Альма", species: "Собака", age: 4, status: "Потрібна допомога", description: "Відновлення після травми лапи." }
].each do |attrs|
  Animal.find_or_create_by!(name: attrs[:name]) do |animal|
    animal.assign_attributes(attrs)
  end
end
