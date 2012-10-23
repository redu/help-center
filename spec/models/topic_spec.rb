require "spec_helper"

describe Topic do

  context "creation" do
    it "should not save without title" do
      topic = Topic.create

      topic.save.should be_false
    end

    it "should create a topic" do
      topic = Topic.new(:title => "Guia Básico")

      topic.save.should be_true
    end
  end

  context "as tree" do
    before do
      @root = Factory(:topic)
    end

    it "should have root" do
      @root.root?.should be_true
    end

    it "should have children" do
      child = Factory(:topic)
      child.move_to_child_of(@root)

      @root.children.first.should == child
    end

    it "should have leaf" do
      leaf = Factory(:topic)
      leaf.move_to_child_of(@root)

      leaf.leaf?.should be_true
    end
  end

  context "get top questions" do
    before do
      @faq = Factory(:faq)

      6.times do
        topic = Factory(:topic)

        topic.move_to_child_of(@faq)
      end
    end

    it "should retrieve only 5 leaves " do
      @faq.order_by_visualizations.count.should == 5
    end

    it "should be ordered by view_count" do
      top = @faq.order_by_visualizations

      top.first.view_count.should be > (top.last.view_count)
    end
  end

  context "get type" do
    it "is faq" do
      faq = Factory(:faq)

      faq.faq?.should be_true
    end

    it "is guide" do
      guide = Factory(:guide)

      guide.guide?.should be_true
    end
  end
end
