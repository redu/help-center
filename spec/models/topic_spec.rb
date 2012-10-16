require "spec_helper"

describe Topic do

  context "creation" do
    it "should not save without title" do
      topic = Topic.create

      topic.save.should be_false
    end

    it "should create a topic" do
      topic = Topic.create(:title => "Guia Básico")

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
end
