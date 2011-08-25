class CreateContactPhones < ActiveRecord::Migration
  def self.up
    create_table :contact_phones do |t|
      t.integer :contact_id
      t.string :phone_number
      t.integer :contact_type_id, :limit => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_phones
  end
end
