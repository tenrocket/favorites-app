require 'rspec'
require './app.rb'

describe Favorites do
	it 'should have favorites listed' do
		Favorite.favorites.should_not be_empty
	end

	it 'should add a favorite' do
		first_count = Favorite.favorites.first_count
	end
end