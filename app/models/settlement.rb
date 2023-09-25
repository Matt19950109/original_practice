class Settlement < ApplicationRecord
  belongs_to :income

  validates :payment, presence: true
end
