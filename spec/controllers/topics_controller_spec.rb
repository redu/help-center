require "spec_helper"
include AuthHelper

describe TopicsController do

  context "GET index" do
    before do
      create(:guide)
      @faq = create(:faq)
    end

    it "should render index" do
      get :index, locale: "pt-BR"

      response.should render_template("topics/index")
    end

    it "should load all roots from Guide" do
      get :index, locale: "pt-BR"

      assigns[:guides].length.should == Guide.count
    end

    context "frequently questions list" do
      before do
        6.times do
          topic = create(:topic)

          topic.move_to_child_of(@faq)
        end
      end

      it "should load top questions in Faq" do
        get :index, locale: "pt-BR"

        assigns[:top_questions].hits.length.should == 5
      end
    end
  end

  context "GET show" do
    before do
      @topic = create(:topic)
    end

    context "faq" do
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

        get :show, id: @faq, locale: "pt-BR"
      end

      it "should render faq" do
        response.should render_template("faqs/show")
      end

      it "should load top_questions" do
        assigns[:top_questions].hits.length.should == 5
      end

      it "should load all categories" do
        assigns[:categories].should == @faq.children
      end
    end

    context "faq category" do
      before do
        faq = create(:faq)
        @category = create(:topic)

        @category.move_to_child_of(faq)
        @topic.move_to_child_of(@category)

        get :show, id: @category, locale: "pt-BR"
      end

      it "should render category show" do
        response.should render_template("faqs/category")
      end

      it "should load all children" do
        assigns[:children].should == @category.children
      end

      it "should load all ancestors" do
        assigns[:ancestors].should == @category.ancestors
      end
    end

    context "basic guide" do
      before do
        @basic = create(:basic_guide)
      end

      it "should render basic guide" do
        get :show, id: @basic, locale: "pt-BR"

        response.should render_template("basic_guides/show")
      end

      it "should load all children" do
        2.times do
          category = create(:topic)
          category.move_to_child_of(@basic)

          3.times do
            topic = create(:topic)
            topic.move_to_child_of(category)
          end
        end
        @basic.reload

        get :show, id: @basic, locale: "pt-BR"

        assigns[:children].should == @basic.children
      end
    end

    context "guide" do
      before do
        @guide = create(:guide)
      end

      it "should render guide" do
        get :show, id: @guide, locale: "pt-BR"

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

        get :show, id: @guide, locale: "pt-BR"

        assigns[:children].should == @guide.children
      end
    end

    context "topics" do
      it "should render show" do
        get :show, id: @topic, locale: "pt-BR"

        response.should render_template("topics/show")
      end

      it "should load all ancestors" do
        guide = create(:guide)
        category = create(:topic)

        category.move_to_child_of(guide)
        @topic.move_to_child_of(category)

        get :show, id: @topic, locale: "pt-BR"

        assigns[:ancestors].should == @topic.ancestors
      end

      it "should increase view_count" do
        expect{
          get :show, id: @topic, locale: "pt-BR"
          @topic.reload
        }.to change(@topic, :view_count).by(1)
      end

      it "should load two topics to read more" do
        guide = create(:guide)
        @topic.move_to_child_of(guide)

        2.times do
          topic = create(:topic)
          topic.move_to_child_of(guide)
        end

        get :show, id: @topic, locale: "pt-BR"

        assigns[:read_more].length.should == 2
      end
    end
  end

  context "New" do
    it "should render topics/new" do
      http_login
      get :new, locale: "pt-BR"

      response.should render_template("topics/new")
    end

    context "POST create" do
      before do
        http_login
        @guide = create(:guide)

        @params =  {
          format: :js,
          locale: "pt-BR",
          parent_id: @guide,
          topic: {
            title: "New topic",
            body: "Help Center" }
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
      @topic = create(:topic)
    end

    it "should render edit" do
      get :edit, id: @topic, locale: "pt-BR"

      response.should render_template("topics/edit")
    end

    it "should load all descendants" do
      category = create(:topic)
      category.move_to_child_of(@topic)

      3.times do
        top = create(:topic)
        top.move_to_child_of(category)
      end
      @topic.reload

      get :edit, id: @topic, locale: "pt-BR"

      assigns[:topics_and_categories].should == @topic.descendants
    end

    context "POST update" do
      it "should update the topic" do
        params = { id: @topic, format: :js, locale: "pt-BR",
                   topic: { body: "focus on the work" } }

        post :update, params

        assigns[:topic].body.should eq("focus on the work")
      end
    end
  end

  context "GET edit_all" do
    it "should render edit_all" do
      http_login
      get "edit_all", locale: "pt-BR"

      response.should render_template("topics/edit_all")
    end
  end

  context "POST destroy" do
    before do
      http_login
      @topic = create(:topic)
      @top_child = create(:topic)

      @top_child.move_to_child_of(@topic)
    end

    it "should delete the topic" do
      delete :destroy, id: @top_child, locale: "pt-BR"

      @topic.children.should be_empty
    end

    it "should redirect to home path" do
      delete :destroy, id: @top_child, locale: "pt-BR"

      response.should redirect_to(root_path)
    end
  end
end
