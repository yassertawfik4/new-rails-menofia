class UsersController < ApplicationController
  # your code goes here
  # GET /users
  def index
    @users = User.all
  end
  # POST /users
  def create
    @user = User.new(name: params[:user][:name], dob: params[:user][:dob], email: params[:user][:email], phone: params[:user][:phone], address: params[:user][:address])
    if @user.save
      redirect_to @user, notice: "User was created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end
  # GET /users/new
  def new
    @user = User.new
  end
  # GET /users/:id/edit
  def edit
    @user = User.find(params[:id])
  end
  # PATCH/PUT /posts/:id
  def update
    @user = User.find(params[:id])
    if @user.update(name: params[:user][:name], dob: params[:user][:dob], email: params[:user][:email], phone: params[:user][:phone], address: params[:user][:address])
      redirect_to @user, notice: "User was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # DELETE /posts/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User was deleted."
  end
end
