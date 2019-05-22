class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :index]
  # after_action :create_profile


  def new
    redirect_to "user_session_path"
  end

  def show
  end

  def index
    @users = User.all
  end

  def create
  @user = User.new(user_params)
  # @profile = Profile.create(user_id: @user.id)
  @profile.user_id = @user.id
  if @user.save
    redirect_to root_url, :notice => "You have succesfully signed up!"
  else
    render "new"
    end
  end

  # def create_profile
  #   Profile.create(user_id: @user.id)
  # end

  private

  def set_user
    @user = current_user
    authorize @user
  end
end
