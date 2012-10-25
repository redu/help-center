require "spec_helper"

describe Topic do

  context "creation" do
    it "should not save without title" do
      topic = Topic.create

      topic.save.should be_false
    end

    it "should create a topic" do
      topic = Topic.new(:title => "Guia Basico")

      topic.save.should be_true
    end
  end

  context "as tree" do
    before do
      @root = FactoryGirl.create(:topic)
    end

    it "should have root" do
      @root.root?.should be_true
    end

    it "should have children" do
      child = FactoryGirl.create(:topic)
      child.move_to_child_of(@root)

      @root.children.first.should == child
    end

    it "should have leaf" do
      leaf = FactoryGirl.create(:topic)
      leaf.move_to_child_of(@root)

      leaf.leaf?.should be_true
    end
  end

  context "get type" do
    it "is faq" do
      faq = FactoryGirl.create(:faq)

      faq.faq?.should be_true
    end

    it "is guide" do
      guide = FactoryGirl.create(:guide)

      guide.guide?.should be_true
    end
  end
end
