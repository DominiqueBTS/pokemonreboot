class PokeballsController < ApplicationController
  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.pokemon = @pokemon
    if @pokeball.save
      redirect_to trainer_path(@pokeball.trainer), notice: "You caught this Pokemon!"
    else
      render "pokemons/show", status: :unprocessable_entity
    end
  end

  def destroy
    @pokeball = Pokeball.find(params[:id])
    @pokeball.destroy
    redirect_to trainer_path(@pokeball.trainer)
  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:trainer_id, :location, :caught_on)
  end
end
