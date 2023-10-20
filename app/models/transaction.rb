class Transaction < ApplicationRecord
  belongs_to :user
  has_many :transaction_categories
  has_many :transactions, through: :transaction_categories

  validates :name, presence: true
  validates :amount, presence: true

  default_scope { order(created_at: :desc) }
end
