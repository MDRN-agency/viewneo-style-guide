module Admin
  class BrandsController < BaseController
    before_action :set_brand, only: [:show, :edit, :update, :destroy]

    def index
      @brands = Brand.order(id: :desc).page(params[:page])
    end

    def show
    end

    def new
      @brand = Brand.new
    end

    def edit
    end

    def create
      @brand = Brand.new(brand_params)

      if @brand.save
        redirect_to admin_brand_path(@brand), notice: 'Brand was successfully created.'
      else
        render :new
      end
    end

    def update
      if @brand.update(brand_params)
        redirect_to admin_brand_path(@brand), notice: 'Brand was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @brand.destroy
      redirect_to admin_brands_url, notice: 'Brand was successfully destroyed.'
    end

    private

    def set_brand
      @brand = Brand.find(params[:id])
    end

    def brand_params
      params.require(:brand).permit(
        :name,
        :summary,
        :description,
        :industry,
        :logo,
        :thumbnail_photo
      )
    end
  end
end
