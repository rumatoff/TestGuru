class Badge < ApplicationRecord

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :badge_img, :rule, presence: true
  validates :rule, uniqueness: { scope: :condition }
  validates_inclusion_of :rule, in: BadgeService::RULES

end
