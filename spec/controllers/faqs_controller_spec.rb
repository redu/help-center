require 'spec_helper'
include AuthHelper

describe FaqsController do
  context "GET new" do
    before do
      http_login
    end

    it "should render faqs/new" do
      get :new, locale: "pt-BR"

      response.should render_template("faqs/new")
    end
  end

  context "POST create" do
    before do
      http_login
      @params =  {
        format: :js,
        locale: "pt-BR",
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
      params = { id: @faq, format: :js, locale: "pt-BR",
                 faq: { body: "focus on the work" } }

      post :update, params

      assigns[:faq].body.should eq("focus on the work")
    end
  end
end
