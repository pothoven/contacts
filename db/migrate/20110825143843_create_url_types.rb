class CreateUrlTypes < ActiveRecord::Migration
  def self.up
    create_table :url_types do |t|
      t.string :name, :limit => 64
      t.boolean :active, :default => true
      t.string :display_name, :limit => 64
      t.string :base_url, :limit => 64

      t.timestamps
    end

    UrlType.enumeration_model_updates_permitted = true
    UrlType.destroy_all
    UrlType.create(:name => 'twitter', :display_name => 'Twitter', :base_url => 'twitter.com')
    UrlType.create(:name => 'facebook', :display_name => 'Facebook', :base_url => 'facebook.com')
    UrlType.create(:name => 'flickr', :display_name => 'Flickr', :base_url => 'flickr.com')
    UrlType.create(:name => 'delicious', :display_name => 'Delicious', :base_url => 'delicious.com')
    UrlType.create(:name => 'personal', :display_name => 'Personal', :base_url => nil)
    UrlType.create(:name => 'work', :display_name => 'Work', :base_url => nil)
    UrlType.create(:name => 'linked', :display_name => 'LinkedIn', :base_url => 'linkedin.com')
    UrlType.create(:name => 'youtube', :display_name => 'YouTube', :base_url => 'youtube.com')
    UrlType.create(:name => 'feed', :display_name => 'Feedburner', :base_url => 'feedburner.com')
    UrlType.create(:name => 'friendfeed', :display_name => 'FriendFeed', :base_url => 'friendfreed.com')
    UrlType.create(:name => 'digg', :display_name => 'Digg', :base_url => 'digg.com')
    UrlType.create(:name => 'lastfm', :display_name => 'LastFM', :base_url => 'last.fm')
    UrlType.enumeration_model_updates_permitted = false


  end

  def self.down
    drop_table :url_types
  end
end
