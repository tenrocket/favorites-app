require 'sinatra'
enable :run

get "/error" do
	"Hold on there killa.  That may not be awesome."
end

get "/" do
	redirect "/favorites"
end

get "/Error" do
	redirect "/error"
end

get "/favorites" do
	@favorites = Favorites.favorites
	erb :"favorites/index"
end

post "/favorites" do
	text = params[:description]
	if Favorites.add_to_favorites(text)
		redirect "/favorites"
	else
		redirect "/Error"
	end
end

class Favorites
	@@favorites = ["Led Zeppelin", "Nike Courage Commercial", "Planet Earth Series"]

	def initialize
	end

	def self.favorites
		@@favorites
	end

	def self.add_to_favorites(favorites)
		if favorites == "Speed Bumps"
			return false
		else
			@@favorites << favorites
		end
	end

end