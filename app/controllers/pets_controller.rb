class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: :index


  def index
    # @pets = Pet.all
    # @pets = @pets.where(species: params[:species]) unless params[:species].blank?
    # @pets = @pets.where(name: params[:name]) unless params[:name].blank?
    # @pets = @pets.where(bio: params[:bio]) unless params[:bio].blank?
    # @pets = @pets.where(age: params[:age]) unless params[:age].blank?
    # @pets = @pets.where(price: params[:price]) unless params[:price].blank?
    @pets = policy_scope(Pet).order(created_at: :desc)
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
    raise
    authorize @pet
    if @pet.save
      format.html { redirect_to @pet, notice: 'pet was successfully created.' }
      format.json { render :show, status: :created, location: @pet }
      redirect_to pets_path(@pet)
    else
      format.html { render :new }
      format.json { render json: @pet.errors, status: :unprocessable_entity }
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
    authorize @pet
  end

  def pet_params
    params.require(:pet).permit(:name, :price, :species, :bio, :age, :photo)
  end
end
