class ProfilePerson < Profile

  validates :person_name, :presence=>true

  def human_name_type
    "Einzelperson"
  end

  def name
    person_name
  end


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

