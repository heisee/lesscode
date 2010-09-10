class Profile < ActiveRecord::Base
  
  belongs_to :user

  acts_as_taggable_on :high_skills, :average_skills
  
  validates :company_name, :zip_code, :city, :presence=>true

  has_attached_file :logo, :styles => { :huge=>"250x500>", :large => "150x300>", :medium => "70x140>", :small => "32x64>", :tiny=>"16x32>" }
  #validates_attachment_size :logo, :less_than => 2.megabytes

  attr_protected :user_id, :logo_file_name, :logo_content_type, :logo_size #nicht mass-assignable über update_attributes

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
#  img_url                 :string(255)
#  logo_file_name          :string(255)
#  logo_content_type       :string(255)
#  logo_file_size          :integer(4)
#  logo_updated_at         :datetime
#  created_at              :datetime
#  updated_at              :datetime
#

