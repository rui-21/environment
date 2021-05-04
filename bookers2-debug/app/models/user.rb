class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  attachment :profile_image, destroy: false

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 50}
  
  # フォローするメソッド
  def follow(user_id)
    follower.create(followed_id: user_id)
  end
  # フォロー外すメソッド
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  # その人をフォローしてるかのチェックするメソッド
  def following?(user)
    following_user.include?(user)
  end
  # フォロー自体しているかのチェックメソッド
  def follow_exists?(user)
    follower.where(follower_id: user.id).exists?
  end
  # フォロワーが存在するかのチェックメソッド
  def follower_exists?(user)
    followed.where(followed_id: user.id).exists?
  end

end
