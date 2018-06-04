class User < ApplicationRecord
  has_many :tweets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email,{uniqueness:true}
  validates :name,{uniqueness:true}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_ordered_taggable_on :communities, :skills, :interests

has_many :friendships
has_many :group_users
has_many :groups,through: :group_users

  def posts
    return Post.where(user_id: self.id)
  end
end
