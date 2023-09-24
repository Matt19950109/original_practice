class Settlement < ApplicationRecord

  validates :payment, presence: true
  validates :bank_account_id, presence: true
end
