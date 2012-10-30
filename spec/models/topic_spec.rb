require "spec_helper"

describe Topic do

  context "creation" do
    it { should validate_presence_of(:title) }
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
  end

  context "read more" do
    context "with many leaves" do
      before do
        @guide = FactoryGirl.create(:guide)
        @leaves = []

        3.times do
          topic = FactoryGirl.create(:topic)
          topic.move_to_child_of(@guide)
          @leaves << topic
        end
      end

      it "should retrieve two next leaves from guide" do
        more = @leaves.first.read_more

        more.should == @leaves.last(2)
      end

      context "if topic is the last leaf" do
        it "should retrieve the leaves before" do
          more = @leaves.last.read_more

          more.should == @leaves.first(2)
        end
      end

      context "if topic is the penultimate leaf" do
        it "should retrieve one leaf before and the last one" do
          more = @leaves.second.read_more

          more.should == [@leaves.first, @leaves.last]
        end
      end
    end

    context "with only one more leaf" do
      before do
        @guide = FactoryGirl.create(:guide)
        @leaves = []

        2.times do
          topic = FactoryGirl.create(:topic)
          topic.move_to_child_of(@guide)
          @leaves << topic
        end
      end

      context "the last one" do
        it "should retrieve the first leaf" do
          more = @leaves.last.read_more

          more.should == [@leaves.first]
        end
      end

      context "the first one" do
        it "should retrieve the last leaf" do
          more = @leaves.first.read_more

          more.should == [@leaves.last]
        end
      end
    end

    context "with no more leaf" do
      before do
        @guide = FactoryGirl.create(:guide)
        @leaves = []

        topic = FactoryGirl.create(:topic)
        topic.move_to_child_of(@guide)
        @leaves << topic
      end

      it "should retrieve any leaf" do
        more = @leaves.first.read_more

        more.should be_empty
      end
    end
  end
end
