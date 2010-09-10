class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :person_name
      t.string :company_name
      t.string :street
      t.string :homepage
      t.string :available_from_type, :null=>false, :default=>"depends"
      t.date   :available_from_date
      t.string :available_duration_type, :null=>false, :default=>"depends"
      t.date   :available_to_date
      t.string :zip_code
      t.string :tag_line
      t.text   :about
      t.string :city
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :type, :null=>false #STI
      t.integer :user_id
      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.datetime :logo_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
