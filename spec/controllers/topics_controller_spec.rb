require "spec_helper"

describe TopicsController do
  before do
    limit = 5
  end

  context "GET index" do
    before do
      Factory(:guide)
      @faq = Factory(:faq)
    end

    it "should render index" do
      get :index

      response.should render_template("topics/index")
    end

    it "should load all roots from Guide" do
      get :index

      assigns[:guides].length.should == Guide.count
    end

    context "frequently questions list" do
      before do
        6.times do
          topic = Factory(:topic)

          topic.move_to_child_of(@faq)
        end
      end

      it "should load top questions in Faq" do
        get :index

        assigns[:top_questions].length.should == limit
      end
    end
  end

  context "GET show" do
    context "Faq" do
      before do
        @faq = Factory(:faq)

        2.times do
          category = Factory(:topic)
          category.move_to_child_of(@faq)

          3.times do
            topic = Factory(:topic)
            topic.move_to_child_of(category)
          end
        end

        @faq.reload
      end

      it "should render faq" do
        get :show, :id => @faq

        response.should render_template("topics/faq")
      end

      it "should load top_questions" do
        get :show, :id => @faq

        assigns[:top_questions].length.should == limit
      end

      it "should load all topics" do
        get :show, :id => @faq

        assigns[:topics_and_categories].length.should == \
          @faq.descendants.length + 1
      end
    end

    context "Guide" do
      before do
        @guide = Factory(:guide)
      end

      it "should render guide" do
        get :show, :id => @guide

        response.should render_template("topics/guide")
      end

      it "should load all topics" do
        2.times do
          category = Factory(:topic)
          category.move_to_child_of(@guide)

          3.times do
            topic = Factory(:topic)
            topic.move_to_child_of(category)
          end
        end
        @guide.reload

        get :show, :id => @guide

        assigns[:topics_and_categories].length.should == \
          @guide.descendants.length + 1
      end
    end

    context "Topic" do
      before do
        @topic = Factory(:topic)
      end

      it "should render show" do
        get :show, :id => @topic

        response.should render_template("topics/show")
      end

      it "should load all ancestors" do
        guide = Factory(:guide)
        category = Factory(:topic)

        category.move_to_child_of(guide)
        @topic.move_to_child_of(category)

        get :show, :id => @topic

        assigns[:ancestors].length.should == @topic.ancestors.length
      end
    end
  end
end
