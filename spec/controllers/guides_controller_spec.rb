require 'spec_helper'
include AuthHelper

describe GuidesController do

  context "GET show" do
    before do
      @guide = create(:guide)
    end

    it "should render guide" do
      get :show, id: @guide

      response.should render_template("guides/show")
    end

    it "should load all topics" do
      2.times do
        category = create(:topic)
        category.move_to_child_of(@guide)

        3.times do
          topic = create(:topic)
          topic.move_to_child_of(category)
        end
      end
      @guide.reload

      get :show, id: @guide

      assigns[:topics_and_categories].length.should == \
        @guide.descendants.length
    end
  end

  context "GET new" do
    it "should render guides/new" do
      http_login
      get :new

      response.should render_template("guides/new")
    end
  end

  context "POST create" do
    before do
      http_login
      @params =  {
        format: :js,
        guide: {
          title: "New guide",
          body: "Basic Guide" }
      }
    end

    it "should create a new guide" do
      expect{
        post :create, @params
      }.to change(Guide, :count).by(1)
    end

    it "should be a root" do
      post :create, @params

      assigns[:guide].root?.should be_true
    end
  end

  context "POST update" do
    before do
      http_login
      @guide = create(:guide)
    end

    it "should update the guide" do
      params = { id: @guide, format: :js,
                 guide: { body: "focus on the work" } }

      post :update, params

      assigns[:guide].body.should eq("focus on the work")
    end
  end
end
