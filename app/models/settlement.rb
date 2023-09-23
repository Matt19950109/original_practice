class Settlement < ApplicationRecord
  belongs_to :income

  validates :payment, presence: true
  validates :bank_account_id, presence: true
end
