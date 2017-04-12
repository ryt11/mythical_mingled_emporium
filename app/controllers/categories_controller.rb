class CategoriesController < ApplicationController
	def show
		@category = Category.includes(:creatures).find_by(name: params[:category])
	end

	def index
		@categories = Category.all
	end
end
