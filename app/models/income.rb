class Income < ApplicationRecord

  validates :amount_price, presence: true
  validates :bank_account, presence: true
end
