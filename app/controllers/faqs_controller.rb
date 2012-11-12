class FaqsController < ApplicationController
  respond_to :html, :js

  before_filter :authenticate, except: [:show]

  def show
    @faq = Topic.find_using_slug(params[:id])

    top_questions
    @categories = @faq.children
  end

  def new
    @faq_new = Faq.new
  end

  def create
    @faq = Faq.new(params[:faq])
    @faq.save

    respond_with(@faq)
  end

  def update
    @faq = Faq.find_using_slug(params[:id])
    @faq.update_attributes(params[:faq])

    redirect_to edit_topic_path(@faq)
  end
end
