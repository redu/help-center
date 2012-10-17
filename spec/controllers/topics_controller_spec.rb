require "spec_helper"

describe TopicsController do

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
        count = 1
        6.times do
          topic = Factory(:topic, :visualizations => count)
          count += 1

          topic.move_to_child_of(@faq)
        end
      end

      it "should load top questions in Faq" do
        get :index

        assigns[:top_questions].length.should == 5
      end
    end
  end
end
