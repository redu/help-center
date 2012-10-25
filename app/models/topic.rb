class Topic < ActiveRecord::Base
  attr_accessible :view_count, :title, :body, :icon_name

  acts_as_nested_set

  validates :title, :presence => true

  searchable do
    text :title, :boost => 3.0
    text :body
    integer :view_count
  end

  def faq?
    self.type == "Faq"
  end

  def guide?
    self.type == "Guide"
  end
end