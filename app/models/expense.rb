class Expense < ApplicationRecord
  belongs_to :user
  has_many :expense_categories
  has_many :expenses, through: :expense_categories

  validates :name, presence: true, length: { minimum: 2 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  default_scope { order(created_at: :desc) }
end
