class CreateStateProvinces < ActiveRecord::Migration
  def self.up
    create_table :state_provinces do |t|
      t.string :name
      t.string :abbrev, :limit => 2
      t.integer :country_id, :limit => 2
    end
  end

  def self.down
    drop_table :state_provinces
  end
end
