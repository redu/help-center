require 'spec_helper'
include AuthHelper

describe BasicGuidesController do
  context "GET new" do
    it "should render guides/new" do
      http_login
      get :new, locale: "pt-BR"

      response.should render_template("basic_guides/new")
    end
  end

  context "POST create" do
    before do
      http_login
      @params =  {
        format: :js,
        locale: "pt-BR",
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
      params = { id: @basic, format: :js, locale: "pt-BR",
                 basic_guide: { body: "focus on the work" } }

      post :update, params

      BasicGuide.find(@basic).body.should eq("focus on the work")
    end
  end
end

