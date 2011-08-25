class CreateContactUrls < ActiveRecord::Migration
  def self.up
    create_table :contact_urls do |t|
      t.integer :contact_id
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_urls
  end
end
