class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
    # binding.pry
    # raise
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "On a créé un blog !"
      else
        render :new
      end
    end
  end
  
  def show    
  end

  def edit    
  end

  def update    
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "J'ai modifié le blog !"
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"J'ai supprimé le blog !"
  end
  def confirm
    @blog = Blog.new(blog_params)
    
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
