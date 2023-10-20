class Expense < ApplicationRecord
  belongs_to :user
  has_many :expense_categories
  has_many :expenses, through: :expense_categories

  validates :name, presence: true
  validates :amount, presence: true

  default_scope { order(created_at: :desc) }
end
