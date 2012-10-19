class TopicsController < ApplicationController
  respond_to :html, :js

  def index
    @guides = Guide.roots
    @top_questions = Faq.root.order_by_visualizations
  end

  def show
    @topic = Topic.find(params[:id])
    @ancestors = @topic.ancestors
  end

  def new

  end

  def create
    @topic = Topic.create(params[:topic])

    @topic.save

    parent = Topic.find(params[:parent_id])
    @topic.move_to_child_of(parent)

    respond_with(@topic)
  end

  def edit
    @topic = Topic.find(params[:id])
    @topics_and_categories = @topic.self_and_descendants
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update_attributes(params[:topic])
      flash[:notice] = 'Tópico editado com sucesso'
      render :index
    else
      render :edit
    end
  end

  def destroy

  end
end
