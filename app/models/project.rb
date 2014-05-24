class Project < ActiveRecord::Base
  
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :notes
  has_many :projects_users
  has_many :users, through: :projects_users

  def owner?(user_id)
    self.user_id == user_id
  end
  
end
