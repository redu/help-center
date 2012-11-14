# encoding: utf-8
class TopicsController < ApplicationController
  require 'viewable'
  respond_to :html, :js

  before_filter :authenticate, except: [:index, :show, :search]

  include Viewable

  def index
    @guides = Guide.roots
    @basic_guide = BasicGuide.root

    top_questions
  end

  def show
    @topic = Topic.find_using_slug(params[:id])

    if @topic.faq?
      @faq = @topic
      top_questions
      @categories = @faq.children

      render 'faqs/show'
    elsif @topic.guide?
      @guide = @topic
      @children = @guide.children

      render 'guides/show'
    elsif @topic.basic?
      @basic = @topic
      @children = @basic.children

      render 'basic_guides/show'
    elsif @topic.leaf?
      update_view_count(@topic)

      @topic.reload
      @ancestors = @topic.ancestors
      @read_more = @topic.read_more
    else
      @ancestors = @topic.ancestors
      @children = @topic.children

      render 'faqs/category'
    end
  end

  def new
    @topic_new = Topic.new
  end

  def create
    @topic = Topic.create(params[:topic])
    @topic.save

    parent = Topic.find(params[:parent_id])
    @topic.move_to_child_of(parent)

    respond_with(@topic)
  end

  def edit
    @topic = Topic.find_using_slug(params[:id])
    @topics_and_categories = @topic.descendants
  end

  def update
    @topic = Topic.find_using_slug(params[:id])
    @topic.update_attributes(params[:topic])

    redirect_to edit_topic_path(@topic)
  end

  def destroy
    @topic = Topic.find_using_slug(params[:id])
    @topic.destroy

    redirect_to :root
  end

  def search
    searching

    @results = @search.results
    @results = Kaminari.paginate_array(@results).page(params[:page])
  end

  def edit_all
    @categories = []
    @categories << Faq.roots
    @categories << BasicGuide.roots
    @categories << Guide.roots
    @categories.flatten!

    render 'topics/edit_all'
  end
end
