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

has_many :active_relationships, class_name: "Relationship",
                                foreign_key: "follower_id",
                                dependent:   :destroy
has_many :passive_relationships, class_name: "Relationship",
                                 foreign_key: "followed_id",
                                 dependent: :destroy
has_many :following, through: :active_relationships, source: :followed
has_many :followers, through: :passive_relationships, source: :follower

# 表示用のリサイズ済み画像を返す
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end

  # タスクメモをフォローする
  def follow(other_taskmemo)
    following << other_taskmemo
  end

  # タスクメモをフォロー解除する
  def unfollow(other_taskmemo)
    active_relationships.find_by(followed_id: other_taskmemo.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_taskmemo)
    following.include?(other_taskmemo)
  end
end

# ユーザーのステータスフィードを返す
def feed
  following_ids = "SELECT followed_id FROM relationships
                   WHERE follower_id = :taskmemo_id"
  Taskmemo.where("taskmemo_id IN (#{following_ids})
                  OR taskmemo_id = :taskmemo_id", taskmemo_id: id)
end
