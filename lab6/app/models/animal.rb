class Animal < ApplicationRecord
  STATUSES = [
    "Шукають дім",
    "Влаштовані",
    "Потрібна допомога"
  ].freeze

  validates :name, presence: true
  validates :species, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }
end
