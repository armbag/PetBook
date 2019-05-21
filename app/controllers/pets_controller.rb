class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :destroy]

  def index
    @pets = Pet.all
    @pets = @pets.where(species: params[:species]) unless params[:species].blank?
    @pets = @pets.where(name: params[:name]) unless params[:name].blank?
    @pets = @pets.where(bio: params[:bio]) unless params[:bio].blank?
    @pets = @pets.where(age: params[:age]) unless params[:age].blank?
    @pets = @pets.where(price: params[:price]) unless params[:price].blank?
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

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :price, :species, :bio, :age, :photo)
  end
end
