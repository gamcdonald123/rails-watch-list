class ListsController < ApplicationController
  def new
  end

  def index
    @lists = List.all
  end

  def show
  end

  def create
  end
end
