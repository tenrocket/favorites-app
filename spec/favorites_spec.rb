require 'rspec'
require './app.rb'

describe Favorite do
	it 'should have favorite breweries listed' do
		Favorite.favorites.should_not be_empty
	end

	it 'should add a favorite brewery' do
		first_count = Favorite.favorites.count
		favorites = "Founders"
		Favorite.add_to_favorites(favorites)
		second_count = Favorite.favorites.count

		second_count.should > first_count
	end

	it 'should not add invalid favorite brewery' do
		favorites = "Bud"
		Favorite.add_to_favorites(favorites).should eq(nil)
	end
end