class GuidesController < ApplicationController
  respond_to :html, :js

  before_filter :authenticate, except: [:show]

  def show
    @guide = Topic.find_using_slug(params[:id])
    @children = @guide.children
  end

  def new
    @guide_new = Guide.new
  end

  def create
    @guide = Guide.new(params[:guide])
    @guide.save

    respond_with(@guide)
  end

  def update
    @guide = Guide.find_using_slug(params[:id])
    @guide.update_attributes(params[:guide])

    redirect_to edit_topic_path(@guide)
  end
end
