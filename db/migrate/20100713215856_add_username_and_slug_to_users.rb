class AddUsernameAndSlugToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
    add_column :users, :cached_slug, :string
  end

  def self.down
    remove_column :users, :username
    remove_column :users, :cached_slug
  end
end
