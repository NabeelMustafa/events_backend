class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: [:create]

  # GET /customers
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /customers
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET /customers/:id
  def show
    json_response(@user)
  end

  # PUT /customers/:id
  def update
    @user.update(user_params)
  end

  # DELETE /customers/:id
  def destroy
    @user.destroy
  end

  private

  def user_params
    # whitelist params
    params.permit(:email, :username, :password, :primary_location)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

