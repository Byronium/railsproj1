class PokemonsController < ApplicationController

	def capture
		pokemon = Pokemon.find(params[:id])
		pokemon.trainer = current_trainer
		pokemon.save
		redirect_to root_path
	end

	def smack
		pokemon = Pokemon.find(params[:id])
		pokemon.health -= 10
		pokemon.save
		if pokemon.health == 0
			pokemon.destroy
		end
		redirect_to :back
	end

	def new
		@pokemon = Pokemon.new
	end 

	def create
		@pokemon = Pokemon.new
		@pokemon.name = params[:pokemon]["name"]
		@pokemon.health = 100
		@pokemon.level = 1
		@pokemon.trainer = current_trainer
		if @pokemon.save
			redirect_to trainer_path(current_trainer)
		else
			redirect_to :back
			flash[:error] = @pokemon.errors.full_messages.to_sentence
		end
	end 

end
