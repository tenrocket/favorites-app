require 'sinatra'
require "sinatra/activerecord"

set :database, "sqlite3:///favorite_things.db"

get "/error" do
	erb :"favorites/error"
end

get "/" do
	redirect "/favorites"
end

get "/favorites" do
	@favorites = Favorite.all
	erb :"favorites/index"
end

get "/confirm" do
	erb :"favorites/confirm"
end

post "/favorites" do
	@favorite = Favorite.new(params[:favorite])
	if @favorite.meet_criteria?
		@favorite.save
		redirect "/confirm"
	else
		redirect "/error"
	end
end

get '/favorites/:id' do
	@delete_favorite = Favorite.find(params[:id])
	erb :"favorites/show"
end

delete '/favorites/:id' do
	@delete_favorite = Favorite.find(params[:id])
	if @delete_favorite.delete
		redirect '/favorites'
	else
		redirect '/favorites/:id'
	end
end

class Favorite < ActiveRecord::Base
	BAD_BEERS = [ "Bud Light", "Miller", "Rolling", "Pabst", "Coors", "Keystone" ]
	def meet_criteria?
		if BAD_BEERS.include? self[:description]
			return false
		else
			return true
		end
	end

	# def delete_breweries(brewery)
	# 	if @deleted_fav.include? brewery
	# 		@deleted_fav.delete(brewery)
	# 	else
	# 		return false
	# 	end
	# end
end