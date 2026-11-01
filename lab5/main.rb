module BarcodePrintable
  def barcode
    "BAR-#{object_id}"
  end
end

module Searchable
  def find_by_author(items, author)
    items.select do |item|
      if item.respond_to?(:author)
        item.author.downcase.include?(author.downcase)
      end
    end
  end

  def find_by_category(items, cat)
    items.select do |item|
      if item.respond_to?(:category)
        item.category.downcase.include?(cat.downcase)
      end
    end
  end
end

class Publication
  include BarcodePrintable

  attr_accessor :title, :pages
  attr_reader :circulation

  def initialize(title: "Без назви", pages: 1, circulation: 100)
    @title = title
    @pages = pages
    self.circulation = circulation
  end

  def circulation=(count)
    raise ArgumentError, "Тираж має бути додатним" if count.to_i <= 0
    @circulation = count.to_i
  end

  def info
    "«#{@title}» (Стор: #{@pages}, Тираж: #{@circulation})"
  end

  def layout
    "Базова розмітка друкованого видання"
  end

  def print_run(copies = nil)
    actual = copies || @circulation
    "Друк «#{@title}»: #{actual} прим. (папір: #{calculate_sheets(actual)} арк.)"
  end

  def larger_than?(other)
    self.raw_pages > other.raw_pages
  end

  def self.standard_dpi
    300
  end

  protected

  def raw_pages
    @pages
  end

  private

  def calculate_sheets(copies)
    ((@pages / 2.0).ceil * copies)
  end
end

class Book < Publication
  attr_accessor :author, :genre

  def initialize(title:, pages:, circulation:, author:, genre:)
    super(title: title, pages: pages, circulation: circulation)
    @author = author
    @genre = genre
  end

  def info
    "#{super} | Автор: #{@author}, Жанр: #{@genre}"
  end

  def layout
    "Книжкова верстка «#{@title}»: тверда обкладинка, титул, зміст."
  end
end

class Magazine < Publication
  attr_accessor :category, :issue_number

  def initialize(title:, pages:, circulation:, category:, issue_number:)
    super(title: title, pages: pages, circulation: circulation)
    @category = category
    @issue_number = issue_number
  end

  def info
    "#{super} | Випуск №#{@issue_number}, Рубрика: #{@category}"
  end

  def layout
    "Журнальна верстка: 3 колонки, глянцеві фото, рубрика #{@category}."
  end
end

class Newspaper < Publication
  attr_accessor :category, :columns

  def initialize(title:, pages:, circulation:, category:, columns: 6)
    super(title: title, pages: pages, circulation: circulation)
    @category = category
    @columns = columns
  end

  def info
    "#{super} | Газетних шпальт: #{@columns}, Рубрика: #{@category}"
  end

  def layout
    "Газетна верстка: #{@columns} колонок, оперативні новини."
  end
end

class Comic < Publication
  attr_accessor :author, :universe

  def initialize(title:, pages:, circulation:, author:, universe:)
    super(title: title, pages: pages, circulation: circulation)
    @author = author
    @universe = universe
  end

  def info
    "#{super} | Сценарист: #{@author}, Всесвіт: #{@universe}"
  end

  def layout
    "Верстка коміксу: графічні панелі, мовні бабли, колір 4+4."
  end

  def print_run(copies = nil)
    "#{super(copies)} [Високоякісний кольоровий друк]"
  end

  def self.standard_dpi
    super * 2
  end
end

class Kiosk
  extend Searchable
end

book = Book.new(title: "Тигролови", pages: 280, circulation: 3000, author: "Іван Багряний", genre: "Пригоди")
mag  = Magazine.new(title: "Наука і Життя", pages: 64, circulation: 1500, category: "Наука", issue_number: 5)
news = Newspaper.new(title: "Галичина", pages: 16, circulation: 5000, category: "Новини")
com  = Comic.new(title: "Людина-павук: Інший світ", pages: 32, circulation: 5000, author: "Стен Лі", universe: "Marvel")

catalog = [book, mag, news, com]

catalog.each do |item|
  puts item.info
  puts item.layout
  puts item.barcode
end

puts book.print_run
puts com.print_run(500)

begin
  book.circulation = -100
rescue ArgumentError => e
  puts e.message
end

puts book.larger_than?(mag)

found_authors = Kiosk.find_by_author(catalog, "Багряний")
found_authors.each do |item|
  puts item.title
end

found_cats = Kiosk.find_by_category(catalog, "Наука")
found_cats.each do |item|
  puts item.title
end

rare_book = Book.new(title: "Стародрук", pages: 600, circulation: 1, author: "Невідомий", genre: "Раритет")

def rare_book.to_s
  "[МУЗЕЙНИЙ АРХІВ] #{super}"
end

puts rare_book.to_s
puts book.to_s

puts Publication.standard_dpi
puts Comic.standard_dpi