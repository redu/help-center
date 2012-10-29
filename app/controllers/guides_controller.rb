class GuidesController < ApplicationController
  respond_to :html, :js

  before_filter :authenticate, except: [:show]

  def show
    @guide = Topic.find(params[:id])
    @topics_and_categories = @guide.descendants
  end

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(params[:guide])
    @guide.save

    respond_with(@guide)
  end

  def update
    @guide = Guide.find(params[:id])
    @guide.update_attributes(params[:guide])

    redirect_to edit_topic_path(@guide)
  end
end
