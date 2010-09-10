class AddUsernameAndSlugToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
    add_column :users, :cached_slug, :string
    #add_column :users, :accepted_tos_and_privacy_version, :integer
  end

  def self.down
    remove_column :users, :username
    remove_column :users, :cached_slug
    #remove_column :users, :accepted_tos_and_privacy_version
  end
end
