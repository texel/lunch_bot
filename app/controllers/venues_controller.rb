class VenuesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
  end

  def new
  end

  def create
    @venue = Venue.create(params[:venue])

    if @venue.new_record?
      render 'new'
    else
      redirect_to venues_path
    end
  end
end
