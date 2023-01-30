class ApartmentsController < ApplicationController

  def index
    apartments = Apartment.all
    render json: apartments
  end

  def show 
    apartment = find_apartment
    if apartment
      render json: apartment
    else
      render json: { error: "Apartment not found" }, status: :not_found
    end
  end

  def create 
    apartment = Apartment.create(apartment_params)
    if apartment
      render json: apartment
    else
      render json: { error: "Apartment not created" }, status: :unprocessable_entity
    end
  end

  def update 
    apartment = find_apartment
    if apartment
      apartment.update(apartment_params)
      render json: apartment
    else
      render json: { error: "Apartment not updated" }, status: :unprocessable_entity
    end
  end

  def destroy 
    apartment = find_apartment
    if apartment
      apartment.destroy
      render json: {}
    else 
      render json: { error: "Apartment not found" }, status: :not_found
    end
  end

  private
  
  def apartment_params
    params.permit(:number)
  end

  def find_apartment
    Apartment.find_by_id(params[:id])
  end
end
