class Topic < ActiveRecord::Base
  attr_accessible :view_count, :title, :body, :icon_name
  acts_as_nested_set

  validates :title, presence: true

  searchable do
    text :title, boost: 3.0
    text :body
    integer :view_count

    boolean :leaf do
      leaf?
    end

    boolean :parent_faq do
      root.faq?
    end
  end

  def faq?
    self.type == "Faq"
  end

  def read_more
    leaves = self.root.leaves
    index = leaves.index(self)

    if leaves.length == 1 || index.nil?
      return []
    end

    # If there is only one more leaf retrieve only one result
    length = leaves.length == 2 ? 1 : 2

    # If leaf is the last one
    if leaves[index + 1].nil?
      leaves[index - length, length]

    # If leaf is the penultimate one
    elsif leaves[index + 2].nil? && length > 1
      # One before and one after
      [leaves[index - 1], leaves[index + 1]]

    else
      leaves[index + 1, length]
    end
  end
end
