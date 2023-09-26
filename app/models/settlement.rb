class Settlement < ApplicationRecord
  belongs_to :income
  has_many :spendings

  validates :payment, presence: true
end
