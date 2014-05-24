class User < ActiveRecord::Base
  
  acts_as_voter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :my_projects, class_name: 'Project', foreign_key: :user_id
  has_many :projects_users
  has_many :shared_projects, through: :projects_users, source: :project

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/100.gif"
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  do_not_validate_attachment_file_type :avatar
end
