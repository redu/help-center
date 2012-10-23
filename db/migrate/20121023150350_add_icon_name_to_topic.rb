class AddIconNameToTopic < ActiveRecord::Migration
  def self.up
    add_column :topics, :icon_name, :string
  end

  def self.down
    remove_column :topics, :icon_name, :string
  end
end
