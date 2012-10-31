require 'spec_helper'
include AuthHelper

describe BasicGuidesController do

  context "GET show" do
    before do
      @basic = create(:basic_guide)
    end

    it "should render basic guide" do
      get :show, id: @basic

      response.should render_template("basic_guides/show")
    end

    it "should load all topics" do
      2.times do
        category = create(:topic)
        category.move_to_child_of(@basic)

        3.times do
          topic = create(:topic)
          topic.move_to_child_of(category)
        end
      end
      @basic.reload

      get :show, id: @basic

      assigns[:topics_and_categories].length.should == \
        @basic.descendants.length
    end
  end

  context "GET new" do
    it "should render guides/new" do
      http_login
      get :new

      response.should render_template("basic_guides/new")
    end
  end

  context "POST create" do
    before do
      http_login
      @params =  {
        format: :js,
        basic_guide: {
          title: "New guide",
          body: "Basic Guide" }
      }
    end

    it "should create a new basic guide" do
      expect{
        post :create, @params
      }.to change(BasicGuide, :count).by(1)
    end

    it "should be a root" do
      post :create, @params

      assigns[:basic].root?.should be_true
    end
  end

  context "POST update" do
    before do
      http_login
      @basic = create(:basic_guide)
    end

    it "should update the basic guide" do
      params = { id: @basic, format: :js,
                 basic_guide: { body: "focus on the work" } }

      post :update, params

      assigns[:basic].body.should eq("focus on the work")
    end
  end
end

