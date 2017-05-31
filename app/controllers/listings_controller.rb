class ListingsController < ApplicationController
  def index
    @listings = Listing.order(id: :desc).all
  end

  def show
    @listing = Listing.find_by(slug: params[:id])
  end
end
