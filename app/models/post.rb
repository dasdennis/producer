class Post < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :comments, :dependent => :destroy
  
  belongs_to :author, 
    :class_name => "User", 
    :foreign_key => "author_id"

  validates_presence_of   :title, :body, :author, :published_at
  validates_uniqueness_of :slug
  validates_inclusion_of :draft, :in => [true, false]
  validates_associated :author

  before_validation :generate_slug

  def self.published
    where("draft = ? AND published_at < ?", false, Time.current)     
  end
  
  def self.search(terms) 
    where("title LIKE :t OR body LIKE :t", :t => "%#{terms}%")
  end
  
  def to_param
    "#{id}-#{slug}"
  end
  
protected

  def generate_slug
    self.slug = self.title unless self.slug.present?
    self.slug = self.slug.parameterize
  end

end

