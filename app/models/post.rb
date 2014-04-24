class Post < ActiveRecord::Base
	validates_presence_of :body, :title
	belongs_to :user
	has_many :comments
	belongs_to :category
	acts_as_taggable
	acts_as_voteable

	scope :with_category, ->(category_id) { where("category_id = ?",category_id) } 
end
