class AddCachedSlugToTopics < ActiveRecord::Migration
  
  def self.up
    add_column :topics, :cached_slug, :string
    add_index  :topics, :cached_slug
  end

  def self.down
    remove_column :topics, :cached_slug
  end
  
end
