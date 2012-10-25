class Topic < ActiveRecord::Base
  attr_accessible :view_count, :title, :body, :icon_name
  acts_as_nested_set

  validates :title, :presence => true

  searchable do
    text :title, :boost => 3.0
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
end
