class TopicsController < ApplicationController
  def index
    @guides = Guide.roots
    @top_questions = Faq.root.order_by_visualizations
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def destroy

  end
end
