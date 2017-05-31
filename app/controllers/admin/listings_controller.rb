module Admin
  class ListingsController < BaseController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]

    def index
      @listings = Listing.order(id: :desc).page(params[:page])
    end

    def show
    end

    def new
      @listing = Listing.new
    end

    def edit
    end

    def create
      @listing = Listing.new(listing_params)

      if @listing.save
        redirect_to admin_listing_path(@listing), notice: 'Listing was successfully created.'
      else
        render :new
      end
    end

    def update
      if @listing.update(listing_params)
        redirect_to admin_listing_path(@listing), notice: 'Listing was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @listing.destroy
      redirect_to admin_listings_url, notice: 'Listing was successfully destroyed.'
    end

    private

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(
        :name,
        :type,
        :summary,
        :description,
        :street_address,
        :city,
        :state,
        :country,
        :logo,
        :thumbnail_photo,
        :cover_photo,
        :website_url,
        :phone_number,
        :email,
        company_ids: [],
        brand_ids: [],
        photos_attributes: [:id, :caption, :image, :_destroy],
        videos_attributes: [:id, :caption, :url, :_destroy],
      )
    end
  end
end
