class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name
      t.string :zip_code
      t.string :location
      t.string :company_name

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
