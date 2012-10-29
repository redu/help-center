class FaqsController < ApplicationController
  respond_to :html, :js

  before_filter :authenticate, except: [:show]

  def show
    @faq = Topic.find(params[:id])

    top_questions
    @topics_and_categories = @faq.descendants
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(params[:faq])
    @faq.save

    respond_with(@faq)
  end

  def update
    @faq = Faq.find(params[:id])
    @faq.update_attributes(params[:faq])

    redirect_to edit_topic_path(@faq)
  end
end
