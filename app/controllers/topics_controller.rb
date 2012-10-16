class TopicsController < ApplicationController
  def index
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
