class Taskmemo < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :product_name, presence: true, length: { maximum: 30 }
  validates :order_number, presence: true, length: { maximum: 6 }
  # validates :delivery_date, presence: true
  # validates :quantity, presence: true
  validates :remarks, presence: true, length: { maximum: 140 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    massage: "有効な画像形式である必要があります" },
                    size: { less_than: 5.megabytes,
                            message: "5MB未満である必要があります" }

  # 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
