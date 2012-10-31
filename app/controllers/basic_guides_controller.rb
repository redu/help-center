class BasicGuidesController < ApplicationController
  respond_to :html, :js

  before_filter :authenticate, except: [:show]

  def show
    @basic = Topic.find(params[:id])
    @topics_and_categories = @basic.descendants
  end

  def new
    @basic = BasicGuide.new
  end

  def create
    @basic = BasicGuide.new(params[:basic_guide])
    @basic.save

    respond_with(@basic)
  end

  def update
    @basic = BasicGuide.find(params[:id])
    @basic.update_attributes(params[:basic_guide])

    redirect_to edit_topic_path(@basic)
  end
end
