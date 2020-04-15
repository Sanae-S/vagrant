class BlogsController < ApplicationController
  def show
    @blog = Blog.find(params[:id])
  end

  def index
    # 記事を全件取得
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

# 4-3 表示された投稿を保存
  def create
    blog = Blog.new(blog_params)
    blog.save
    redirect_to blogs_path(blog.id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
end
