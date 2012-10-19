class FaqsController < ApplicationController
  respond_to :html, :js

  def show
    @faq = Topic.find(params[:id])

    @top_questions = Faq.root.order_by_visualizations
    @topics_and_categories = @faq.self_and_descendants
  end

  def create
    @faq = Faq.new(params[:faq])
    @faq.save

    respond_with(@faq)
  end
end
