class Transaction < ApplicationRecord
  belongs_to :wallet

  scope :deposits, -> { where transaction_type: 0 }
  scope :expenses, -> { where transaction_type: 1 }
end
