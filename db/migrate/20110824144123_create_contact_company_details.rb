class CreateContactCompanyDetails < ActiveRecord::Migration
  def self.up
    create_table :contact_company_details do |t|
      t.integer :contact_id
      t.string :title, :limit => 32
      t.string :organization

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_company_details
  end
end
