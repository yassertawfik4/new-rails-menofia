class PostsController < ApplicationController
  # your code goes here
  # GET /posts
  def index
    @posts = Post.all
  end
  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end
  # GET /posts/new
  def new
    @post = Post.new
  end
  # POST /posts
  def create
    @post=Post.new(title: params[:post][:title], content: params[:post][:content])
    if @post.save
      redirect_to @post, notice: "Post was created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  # GET /posts/:id/edit
  def edit
    @post = Post.find(params[:id])
  end
  # PATCH/PUT /posts/:id
  def update
    @post = Post.find(params[:id])
    if @post.update(title: params[:post][:title], content: params[:post][:content])
      redirect_to @post, notice: "Post was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # DELETE /posts/:id
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post was deleted."
  end
end
