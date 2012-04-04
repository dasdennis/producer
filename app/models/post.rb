class Post < ActiveRecord::Base
  validates_presence_of :title, :body, :author
  validates_associated :author

  has_and_belongs_to_many :categories
  has_many :comments, :dependent => :destroy
  
  belongs_to :author, 
    :class_name => "User", 
    :foreign_key => "author_id"


end
