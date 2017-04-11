class CategoriesController < ApplicationController
	def show
		@category = Category.includes(:creatures).find_by(name: params[:category])
	end
end