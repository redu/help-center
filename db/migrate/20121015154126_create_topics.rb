class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      # STI
      t.string :type

      t.string :title
      t.text :body
      t.integer :visualizations, :default => 0

      # atributos para usar nested_set do activerecord
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
