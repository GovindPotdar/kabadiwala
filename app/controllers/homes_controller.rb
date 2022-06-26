class HomesController < ApplicationController

  def index
    # puts user_signed_in?
    @scraps = Scrap.all
    
  end
end
