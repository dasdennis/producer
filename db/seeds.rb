# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

Category.create(name:"Rails")
Category.create(name:"Ruby")
Category.create(name:"UI Design")
Category.create(name:"Agile")
Category.create(name:"Sysadmin")
Category.create(name:"Frontend")

User.create(
  :first_name => "Admin", 
  :last_name => "User", 
  :email => "admin@producer.com", 
  :password => "123456",
  :password_confirmation => "123456"
)