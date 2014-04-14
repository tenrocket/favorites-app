require 'rspec'
require './app.rb'

describe Favorites do
	it 'should have favorites listed' do
		Favorites.favorites.should_not be_empty
	end

	it 'should add a favorite' do
		first_count = Favorites.favorites.first_count
	end
end