class Post < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :comments, :dependent => :destroy
  
  belongs_to :author, 
    :class_name => "User", 
    :foreign_key => "author_id"

  validates_presence_of :title, :body, :author, :permalink
  validates_uniqueness_of :permalink
  validates_inclusion_of :draft, :in => [true, false]
  validates_associated :author

end
