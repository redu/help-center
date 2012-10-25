# encoding: utf-8
class TopicsController < ApplicationController
  require 'viewable'
  respond_to :html, :js

  before_filter :authenticate, :except => [:index, :show, :searching]

  include Viewable

  def index
    @guides = Guide.roots

    top_questions
  end

  def show
    @topic = Topic.find(params[:id])
    update_view_count(@topic)

    @topic.reload
    @ancestors = @topic.ancestors
  end

  def new
    @topic = Topic.new
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
    @topics_and_categories = @topic.descendants
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update_attributes(params[:topic])

    redirect_to edit_topic_path(@topic)
  end

  # TODO specs
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    flash[:notice] = "Tópico removido"
    redirect_to :root
  end

  def searching
    search

    render :search
  end
end
