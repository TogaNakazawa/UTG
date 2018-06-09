class Group < ApplicationRecord
  has_many :group_user
  has_many :users, through: :group_user
  accepts_nested_attributes_for :group_user
end
