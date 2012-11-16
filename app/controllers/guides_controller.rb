class GuidesController < ApplicationController
  respond_to :html

  before_filter :authenticate

  def new
    @guide_new = Guide.new
  end

  def create
    @guide = Guide.new(params[:guide])
    @guide.save

    redirect_to edit_topic_path(@guide)
  end

  def update
    @guide = Guide.find_using_slug(params[:id])
    @guide.update_attributes(params[:guide])

    redirect_to edit_topic_path(@guide)
  end
end
