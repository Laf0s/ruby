class Animal < ApplicationRecord
  STATUSES = [
    "Шукають дім",
    "Влаштовані",
    "Потрібна допомога"
  ].freeze

  belongs_to :user
  has_one_attached :image

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :species, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :description, presence: true, length: { minimum: 10, maximum: 500 }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validate :acceptable_image

  private

  def acceptable_image
    return unless image.attached?

    unless image.blob.byte_size <= 5.megabytes
      errors.add(:image, "не повинно перевищувати 5 МБ")
    end

    acceptable_types = [ "image/jpeg", "image/png", "image/webp" ]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "має бути у форматі JPEG, PNG або WebP")
    end
  end
end
