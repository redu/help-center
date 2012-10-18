class Topic < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :visualizations, :title

  validates :title, :presence => true

  def order_by_visualizations
    self.leaves.all.sort!{ |a, b| b.visualizations <=> a.visualizations }.take(5)
  end

  def faq?
    self.type == "Faq"
  end

  def guide?
    self.type == "Guide"
  end
end
