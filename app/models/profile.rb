class Profile < ActiveRecord::Base
  
  belongs_to :user
  
  validates :company_name, :zip_code, :presence=>true

  attr_protected :user_id #nicht mass-assignable über update_attributes

end
