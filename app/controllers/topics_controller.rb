class TopicsController < ApplicationController
  def index
    @guides = Guide.roots
    @top_questions = Faq.root.order_by_visualizations
  end

  def show
    @topic = Topic.find(params[:id])

    if @topic.faq?
      @top_questions = Faq.root.order_by_visualizations
      @topics_and_categories = @topic.self_and_descendants

      render :faq
    elsif @topic.guide?
      @topics_and_categories = @topic.self_and_descendants

      render :guide
    else
      @ancestors = @topic.ancestors
    end
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
