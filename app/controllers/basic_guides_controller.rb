class BasicGuidesController < ApplicationController
  respond_to :html, :js

  before_filter :authenticate, except: [:show]

  def show
    @basic = Topic.find_using_slug(params[:id])
    @children = @basic.children
  end

  def new
    @basic_new = BasicGuide.new
  end

  def create
    @basic = BasicGuide.new(params[:basic_guide])
    @basic.save

    respond_with(@basic)
  end

  def update
    @basic = BasicGuide.find_using_slug(params[:id])
    @basic.update_attributes(params[:basic_guide])

    redirect_to edit_topic_path(@basic)
  end
end
