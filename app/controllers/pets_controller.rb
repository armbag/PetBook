class PetsController < ApplicationController
  before_action :set_pet, only: [:show]

  def index
    @pets = Pet.where(species: params[:species])
    @pets = Pet.where(name: params[:name])
    @pets = Pet.where(bio: params[:bio])
    @pets = Pet.where(age: params[:age])
    @pets = Pet.where(price: params[:price])

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
      render :new
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :price, :species, :bio, :age, :photo)
  end
end
