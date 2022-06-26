class HomesController < ApplicationController

  def index
    # puts user_signed_in?
    @scraps = Scrap.all
    system "clear"
    @units = Unit.all
    @units.each do |u|
      puts "{id:#{u.id},name:'#{u.name}'}"
    end

  end
end
