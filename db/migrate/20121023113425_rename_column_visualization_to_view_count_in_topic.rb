class RenameColumnVisualizationToViewCountInTopic < ActiveRecord::Migration
  def self.up
    rename_column :topics, :visualizations, :view_count
  end

  def self.down
    rename_column :topics, :visualizations, :view_count
  end
end
