require 'spec_helper'

describe GuidesController do
  context "GET show" do
    before do
      @guide = Factory(:guide)
    end

    it "should render guide" do
      get :show, :id => @guide

      response.should render_template("guides/show")
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

  context "POST create" do
    before do
      @params =  {
        :format => :js,
        :guide => {
          :title => "New guide",
          :body => "Central de Ajuda" }
      }
    end

    it "should create a new guide" do
      expect{
        post :create, @params
      }.should change(Guide, :count).by(1)
    end

    it "should be a root" do
      post :create, @params

      assigns[:guide].root?.should be_true
    end
  end
end
