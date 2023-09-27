class Settlement < ApplicationRecord
  belongs_to :income
  has_many :spendings, dependent: :delete_all

  validates :payment, presence: true
end
