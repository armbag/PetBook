class PetsController < ApplicationController
  before_action :set_pet, only: [:show]

  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.owner = current_user
    if @pet.save
      redirect_to pets_path(@pet)
    else
      p @pet.errors
      render :new
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :price, :species, :bio, :age)
  end
end
