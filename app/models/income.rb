class Income < ApplicationRecord
  has_many :settlements

  validates :amount_price, presence: true
  validates :bank_account, presence: true
end
