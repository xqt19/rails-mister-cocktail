require 'pry-byebug'

class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def show
    @dose = Dose.find(params[:id])
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(
      cocktail_id: params["cocktail_id"],
      ingredient_id: params["dose"]["ingredient_id"],
      description: params["dose"]["description"]
      )

    if @dose.save
      redirect_to cocktail_path(@dose.cocktail_id)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private
  # not needed
  # def dose_params
  #   params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  # end
end
