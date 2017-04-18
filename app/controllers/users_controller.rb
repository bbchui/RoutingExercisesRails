class UsersController < ApplicationController
  def index
    if params[:username]
      query = params[:username]
      users = User.where("#{query} like username or username like #{query}")

      render json: users
    else
      users = User.all
      render json: users #json: users
    end
  end

  def create
    user = User.new(user_params)
  # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: 422
      )
    end
  end

  def show
    if user = User.find(params[:id])
      render json: user
    else
      render(
        json: user.errors.full_messages, status: 422
      )
    end
  end

  def update
    user = User.update(params[:id], user_params)
    if user
      render json: user
    else
      render(
        json: user.errors.full_messages, status: 422
      )
    end
  end

  def destroy
    user = User.find(params[:id]).destroy
    if user
      render json: user
    else
      render(
        json: user.errors.full_messages, status: 422
      )
    end
  end

  def artworks
    redirect_to artworks_url
  end


  private

  def user_params
    params[:user].permit(:username)
  end

end
