require 'spec_helper'

describe Profile do
  pending "add some examples to (or delete) #{__FILE__}"
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

