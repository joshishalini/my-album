class HomeController < ApplicationController

	def index
		@images = Image.last(25).reverse
	end
end
