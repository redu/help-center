class FaqsController < ApplicationController
  respond_to :html

  before_filter :authenticate

  def new
    @faq_new = Faq.new
  end

  def create
    @faq = Faq.new(params[:faq])
    @faq.save

    redirect_to edit_topic_path(@faq)
  end

  def update
    @faq = Faq.find_using_slug(params[:id])
    @faq.update_attributes(params[:faq])

    redirect_to edit_topic_path(@faq)
  end
end
