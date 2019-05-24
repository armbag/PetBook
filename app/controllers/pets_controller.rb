

class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: :index


  def index

    @pets = policy_scope(Pet)
    @pets = @pets.where(species: params[:species]) unless params[:species].blank?
    @pets = @pets.joins(:owner).where.not(users: {latitude: nil, longitude: nil}).order(created_at: :desc)
    @pets = @pets.near(params[:location], 100) unless params[:location].blank?
    @markers = @pets.map do |pet|
      { lat: pet.owner.latitude,
        lng: pet.owner.longitude }
    end
  end

  def show
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.owner = current_user
    authorize @pet
    if @pet.save
      redirect_to user_path(@pet), notice: 'pet was successfully created.'
    else
      render :new
    end
  end

  def destroy
    if @pet.owner == current_user
      @pet.destroy
      redirect_to user_path, notice: 'pet was successfully deleted.'
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def pet_params
    params.require(:pet).permit(:name, :price, :species, :bio, :age, :photo, :from, :to)
  end
end
