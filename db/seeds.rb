# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
if ENV["disable_humanizer"]!="true"
  puts "Hier sollte disable_humanizer auf true gesetzt werden!"
end

u=User.create!(:username=>"heiko.seebach", :email=>"example@example.com", :password=>"test12", :password_confirmation=>"test12")
u.confirm!
ProfilePerson.create!(
  :user=>u,
  :high_skill_list=>"Ruby, Rails, Linux, Java",
  :average_skill_list=>"Windows, SQL-Server",
  :person_name=>"Heiko Seebach",
  :company_name=>"telewebber GmbH",
  :homepage=>"http://lesscode.de",
  :zip_code=>"75015",
  :city=>"Bretten",
  :about=>"Überschrift\n=====\n * funktioniert",
  :tag_line=>"LessCode-Gründer")