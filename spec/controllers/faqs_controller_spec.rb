require 'spec_helper'

describe FaqsController do
  context "GET show" do
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

      response.should render_template("faqs/show")
    end

    it "should load top_questions" do
      get :show, :id => @faq

      assigns[:top_questions].length.should == 5
    end

    it "should load all topics" do
      get :show, :id => @faq

      assigns[:topics_and_categories].length.should == \
        @faq.descendants.count + 1
    end
  end

  context "POST create" do
    before do
      @params =  {
        :format => :js,
        :faq => {
          :title => "New faq",
          :body => "Central de Ajuda" }
      }
    end

    it "should create a new faq" do
      expect{
        post :create, @params
      }.should change(Faq, :count).by(1)
    end

    it "should be a root" do
      post :create, @params

      assigns[:faq].root?.should be_true
    end
  end
end
