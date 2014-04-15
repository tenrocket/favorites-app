require 'sinatra'
enable :run

get "/error" do
	erb :"favorites/error"
end

get "/" do
	redirect "/favorites"
end

get "/favorites" do
	@favorites = Favorite.favorites
	erb :"favorites/index"
end

get "/confirm" do
	erb :"favorites/confirm"
end

post "/favorites" do
	text = params[:description]
	if Favorite.add_to_favorites(text)
		redirect "/confirm"
	else
		redirect "/error"
	end
end

class Favorite
	@@favorites = ["Founders", "New Holland", "Bell's", "Wild Heaven"]

	def initialize
	end

	def self.favorites
		@@favorites
	end

	def self.add_to_favorites(favorites)
		if favorites.include? "Bud" 
		elsif favorites.include? "Miller"
		elsif favorites.include? "Rolling" 
		elsif favorites.include? "Pabst"
		elsif favorites.include? "Coors" 
		elsif favorites.include? "Keystone" 
			return false
		else
			@@favorites << favorites
		end
	end

end