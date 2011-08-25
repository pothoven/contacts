class CreateContactTypes < ActiveRecord::Migration
  def self.up
    create_table :contact_types do |t|
      t.string :name
    end
    ContactType.enumeration_model_updates_permitted = true
    ContactType.create(:name => 'home')
    ContactType.create(:name => 'mobile')
    ContactType.create(:name => 'work')
    ContactType.create(:name => 'fax')
    ContactType.enumeration_model_updates_permitted = false
  end

  def self.down
    drop_table :contact_types
  end
end
