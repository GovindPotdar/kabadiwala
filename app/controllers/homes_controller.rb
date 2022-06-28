class HomesController < ApplicationController

  def index
    @scraps = Scrap.all
  end
  
end
