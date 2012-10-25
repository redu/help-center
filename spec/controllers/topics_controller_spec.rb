require "spec_helper"

include AuthHelper

describe TopicsController do

  context "GET index" do
    before do
      FactoryGirl.create(:guide)
      @faq = FactoryGirl.create(:faq)
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
          topic = FactoryGirl.create(:topic)

          topic.move_to_child_of(@faq)
        end
      end

      it "should load top questions in Faq" do
        get :index

        assigns[:top_questions].hits.length.should == 5
      end
    end
  end

  context "GET show" do
    before do
      @topic = FactoryGirl.create(:topic)
    end

    it "should render show" do
      get :show, :id => @topic

      response.should render_template("topics/show")
    end

    it "should load all ancestors" do
      guide = FactoryGirl.create(:guide)
      category = FactoryGirl.create(:topic)

      category.move_to_child_of(guide)
      @topic.move_to_child_of(category)

      get :show, :id => @topic

      assigns[:ancestors].length.should == @topic.ancestors.count
    end

    it "should increase view_count" do
      expect{
        get :show, :id => @topic
        @topic.reload
      }.to change(@topic, :view_count).by(1)
    end
  end

  context "New" do
    it "should render topics/new" do
      http_login
      get :new

      response.should render_template("topics/new")
    end

    context "POST create" do
      before do
        http_login
        @guide = FactoryGirl.create(:guide)

        @params =  {
          :format => :js,
          :parent_id => @guide,
          :topic => {
            :title => "New topic",
            :body => "Central de Ajuda" }
        }
      end

      it "should create a new topic" do
        expect{
          post :create, @params
        }.to change(Topic, :count).by(1)
      end

      it "should be a leave" do
        post :create, @params

        assigns[:topic].leaf?.should be_true
      end

      it "should have a guide as parent" do
        post :create, @params

        @guide.reload
        assigns[:topic].parent.id.should be(@guide.id)
      end
    end
  end

  context "Edit" do
    before do
      http_login
      @topic = FactoryGirl.create(:topic)
    end

    it "should render edit" do
      get :edit, :id => @topic

      response.should render_template("topics/edit")
    end

    it "should load all descendants" do
      category = FactoryGirl.create(:topic)
      category.move_to_child_of(@topic)

      3.times do
        top = FactoryGirl.create(:topic)
        top.move_to_child_of(category)
      end
      @topic.reload

      get :edit, :id => @topic

      assigns[:topics_and_categories].length.should == @topic.descendants.count
    end

    context "POST update" do
      it "should update the topic" do
        params = { :id => @topic, :format => :js,
                   :topic => { :body => "foca no trabalho" } }

        post :update, params

        assigns[:topic].body.should eq("foca no trabalho")
      end
    end
  end

  context "POST destroy" do
    before do
      http_login
      @topic = FactoryGirl.create(:topic)
      @top_child = FactoryGirl.create(:topic)

      @top_child.move_to_child_of(@topic)
    end

    it "should delete the topic" do
      delete :destroy, :id => @top_child

      @topic.children.should be_empty
    end

    it "should redirect to home path" do
      delete :destroy, :id => @top_child

      response.should redirect_to(root_path)
    end
  end
end