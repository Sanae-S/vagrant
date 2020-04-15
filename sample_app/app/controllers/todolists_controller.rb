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
# 3−7 編集対象のデータをviewに渡す
  def edit
    @list = List.find(params[:id])
  end
# 3-7 編集内容を保存して送信
def update
  list = List.find(params[:id])
  list.update(list_params)
  redirect_to todolist_path(list.id)
end
# 3-9
def destroy
  list = List.find(params[:id])
  list.destroy
  redirect_to todolists_path
end

  private

  def list_params
  	params.require(:list).permit(:title, :body, :image)
  end

end
