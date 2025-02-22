class PokemonsController < ApplicationController
  def index
    if params[:query].present?
      @pokemons = Pokemon.search_by_name(params[:query])
    else
      @pokemons = Pokemon.all
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @pokeball = Pokeball.new # Ensure it's initialized
  end

  def random
    @pokemon = Pokemon.order("RANDOM()").first
    @pokeball = Pokeball.new(caught_on: Date.today)
    render :show
  end
end
