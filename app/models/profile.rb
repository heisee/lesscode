class Profile < ActiveRecord::Base
  
  belongs_to :user
  
  validates :person_name, :company_name, :zip_code, :presence=>true

  has_attached_file :logo, :styles => { :huge=>"500x500>", :large => "300x300>", :medium => "100x100>", :small => "50x50>", :tiny=>"32x32>" }

  attr_protected :user_id #nicht mass-assignable über update_attributes

end

# == Schema Information
#
# Table name: profiles
#
#  id                      :integer(4)      not null, primary key
#  person_name             :string(255)
#  company_name            :string(255)
#  street                  :string(255)
#  homepage                :string(255)
#  available_from_type     :string(255)     default("depends"), not null
#  available_from_date     :date
#  available_duration_type :string(255)     default("depends"), not null
#  available_to_date       :date
#  zip_code                :string(255)
#  about                   :text
#  city                    :string(255)
#  phone                   :string(255)
#  mobile                  :string(255)
#  email                   :string(255)
#  type                    :string(255)     not null
#  user_id                 :integer(4)
#  created_at              :datetime
#  updated_at              :datetime
#

