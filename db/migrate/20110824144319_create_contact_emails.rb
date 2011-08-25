class CreateContactEmails < ActiveRecord::Migration
  def self.up
    create_table :contact_emails do |t|
      t.integer :contact_id
      t.string :email, :limit => 255
      t.integer :contact_type_id, :limit => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_emails
  end
end
