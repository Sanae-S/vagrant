class TodolistsController < ApplicationController
  def new
  	@list = List.new
  end

  # add 3-5
  def create

  	list = List.new(list_parpams)

  	list.save

  	redirect_to '/top'
  end

  def index
  	@lists = List.all
  end


  private

  def list_parpams
  	parpams.require(:list).permit(:title, :body)
  end

end
