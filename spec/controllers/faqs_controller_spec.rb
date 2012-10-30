require 'spec_helper'
include AuthHelper

describe FaqsController do

  context "GET show" do
    before do
      @faq = create(:faq)

      2.times do
        category = create(:topic)
        category.move_to_child_of(@faq)

        3.times do
          topic = create(:topic)
          topic.move_to_child_of(category)
        end
      end

      @faq.reload
    end

    it "should render faq" do
      get :show, id: @faq

      response.should render_template("faqs/show")
    end

    it "should load top_questions" do
      get :show, id: @faq

      assigns[:top_questions].hits.length.should == 5
    end

    it "should load all topics" do
      get :show, id: @faq

      assigns[:topics_and_categories].length.should == \
        @faq.descendants.count
    end
  end

  context "GET new" do
    before do
      http_login
    end

    it "should render faqs/new" do
      get :new

      response.should render_template("faqs/new")
    end
  end

  context "POST create" do
    before do
      http_login
      @params =  {
        format: :js,
        faq: {
          title: "New faq",
          body: "Frequently questions" }
      }
    end

    it "should create a new faq" do
      expect{
        post :create, @params
      }.to change(Faq, :count).by(1)
    end

    it "should be a root" do
      post :create, @params

      assigns[:faq].root?.should be_true
    end
  end

  context "POST update" do
    before do
      http_login
      @faq = create(:faq)
    end

    it "should update the faq" do
      params = { id: @faq, format: :js,
                 faq: { body: "focus on the work" } }

      post :update, params

      assigns[:faq].body.should eq("focus on the work")
    end
  end
end
