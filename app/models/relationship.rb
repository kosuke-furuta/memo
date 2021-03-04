class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Taskmemo"
  belongs_to :followed, class_name: "Taskmemo"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
