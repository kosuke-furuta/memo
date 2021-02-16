class Taskmemo < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :product_name, presence: true, length: { maximum: 20 }
  validates :order_number, presence: true, length: { maximum: 6 }
  # validates :delivery_date, presence: true
  # validates :quantity, presence: true
  # validates :remarks, presence: true
end
