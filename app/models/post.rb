class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_category_relations
  has_many :categories, through: :post_category_relations
  attachment :image

  validates :title, presence: true
  validates :body, presence: true
  validates :shop, presence: true
  validates :prefectures, presence: true


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end



end
