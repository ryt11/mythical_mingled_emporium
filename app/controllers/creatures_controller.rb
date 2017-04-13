class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
  end

  def show
  end
end
