class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable, :timeoutable

  validates :username, :presence=>true

  # Setup accessible (or protected) attributes for your model
  # Muss vor has_friendly_id kommen, weil dort attr_protected gesetzt wird!
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  has_friendly_id :username, :use_slug => true
  has_many :profiles
end
