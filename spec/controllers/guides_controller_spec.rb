require 'spec_helper'
include AuthHelper

describe GuidesController do
  context "GET new" do
    it "should render guides/new" do
      http_login
      get :new, locale: "pt-BR"

      response.should render_template("guides/new")
    end
  end

  context "POST create" do
    before do
      http_login
      @params =  {
        format: :js,
        locale: "pt-BR",
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
      params = { id: @guide, format: :js, locale: "pt-BR",
                 guide: { body: "focus on the work" } }

      post :update, params

      assigns[:guide].body.should eq("focus on the work")
    end
  end
end
