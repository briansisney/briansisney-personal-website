class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]
  def index
    @blogs = Blog.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    respond_to do |format|
      if @blog.save
        format.html { redirect_to blogs_path, notice: 'blog was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'blog was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html {redirect_to blogs_url }
    end
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end
  def blog_params
    params.require(:blog).permit(:title, :post, :image, :date)
  end
end
