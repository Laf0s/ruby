# Лабораторна робота №6–8 (Варіант 35)

**Тема:** Робота з компонентами MVC-RoR проєкту, автентифікація (Devise), ролі доступу та Active Storage  
**Предметна область:** Притулок для тварин

## Реалізовано (ЛР7 + ЛР8)
1. **Макет і Bootstrap (ЛР7):**
   - Хедер (`_header.html.erb`) з навігацією `nav-pills` та кнопкою `Donate / Допомогти` (відкриває модальне вікно).
   - Футер (`_footer.html.erb`) з реквізитами благодійного фонду та контактами розробника.
   - Вкладки `nav-pills` + `tab-content` для статусів: `Шукають дім`, `Влаштовані`, `Потрібна допомога`.
2. **Автентифікація та ролі (Devise):**
   - Інтеграція `gem "devise"` з моделлю `User`, додано поле `name` (через Strong Parameters у `ApplicationController`) та ролі `enum :role, { user: 0, admin: 1 }` із методом `admin?`.
3. **Асоціації та валідації:**
   - `User has_many :animals, dependent: :destroy` / `Animal belongs_to :user`.
   - Валідації в `User` (`name`, `email`) та `Animal` (`name` 2–50 символів, `species`, `age >= 0`, `description` 10–500 символів, `status`).
4. **Робота із зображеннями (Active Storage):**
   - `has_one_attached :image` в `Animal` з валідацією формату (`JPEG/PNG/WebP`) та розміру (до 5 МБ).
5. **Авторизація, кабінет і сторінка «Про проєкт»:**
   - Створення/редагування/видалення доступні лише авторизованим користувачам; `user` керує лише своїми записами, `admin` — будь-якими (включно з `destroy_all`).
   - Особистий кабінет (`/profile`) зі списком створених користувачем тварин.

## Запуск
```bash
cd lab6
bin/rails db:migrate
bin/rails db:seed
bin/rails server
```

Тестові облікові записи (після `db:seed`):
- Адміністратор: `admin@example.com` / `password123`
- Користувач: `user@example.com` / `password123`

## Тести
```bash
cd lab6
bin/rails test
```
