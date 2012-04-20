class User < ActiveRecord::Base

  has_many :posts, foreign_key: "author_id"

  devise :database_authenticatable, :recoverable, 
         :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, 
    :remember_me, :first_name, :last_name
  
  validates_presence_of :first_name, :last_name
  
  def full_name
    [first_name, last_name].join(" ")
  end

end

