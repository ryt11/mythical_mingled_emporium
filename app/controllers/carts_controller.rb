class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    creature = Creature.find(params[:creature_id])

    @cart.add_creature(creature.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(creature.id), creature.breed)}."

    redirect_back(fallback_location: root_path)
  end

  def index
  end
end
