class User < ActiveRecord::Base
  include Humanizer

  validates_acceptance_of :accept_tos_and_privacy

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :token_authenticatable, :confirmable, :lockable, :timeoutable

  validates :username, :presence=>true
 # validates :accept_tos_and_privacy, :acceptance => true

  if ENV["disable_humanizer"]!="true"
    require_human_on :create
  end
  
  # Setup accessible (or protected) attributes for your model
  # Muss vor has_friendly_id kommen, weil dort attr_protected gesetzt wird!
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, 
    :humanizer_question_id, :humanizer_answer, :accept_tos_and_privacy

  has_friendly_id :username, :use_slug => true
  has_many :profiles

end

# == Schema Information
#
# Table name: users
#
#  id                   :integer(4)      not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer(4)      default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  confirmation_token   :string(255)
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  failed_attempts      :integer(4)      default(0)
#  unlock_token         :string(255)
#  locked_at            :datetime
#  authentication_token :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  username             :string(255)
#  cached_slug          :string(255)
#

