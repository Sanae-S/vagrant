class TodolistsController < ApplicationController
  def new
  	@list = List.new
  end

  # add 3-5
  def create
  	list = List.new(list_params)

  	list.save
# データベースへ保存
  	redirect_to todolist_path(list.id)
# 3-6詳細画面へリダイレクト
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  private

  def list_params
  	params.require(:list).permit(:title, :body)
  end

end
