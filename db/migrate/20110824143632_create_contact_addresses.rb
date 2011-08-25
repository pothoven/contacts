class CreateContactAddresses < ActiveRecord::Migration
  def self.up
    create_table :contact_addresses do |t|
      t.integer :contact_id
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :postal
      t.integer :state_province_id, :limit => 2
      t.integer :country_id, :limit => 2
      t.integer :contact_type_id, :limit => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_addresses
  end
end
