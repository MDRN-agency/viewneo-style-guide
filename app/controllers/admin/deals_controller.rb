module Admin
  class DealsController < BaseController
    before_action :set_deal, only: [:show, :edit, :update, :destroy]

    def index
      @deals = Deal.order(id: :desc).page(params[:page])
    end

    def show
    end

    def new
      @deal = Deal.new
    end

    def edit
    end

    def create
      @deal = Deal.new(deal_params)

      if @deal.save
        redirect_to admin_deal_path(@deal), notice: 'Deal was successfully created.'
      else
        render :new
      end
    end

    def update
      if @deal.update(deal_params)
        redirect_to admin_deal_path(@deal), notice: 'Deal was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @deal.destroy
      redirect_to admin_deals_url, notice: 'Deal was successfully destroyed.'
    end

    private

    def set_deal
      @deal = Deal.find(params[:id])
    end

    def deal_params
      params.require(:deal).permit(
        :title,
        :teaser,
        :description,
        :thumbnail_photo,
        :cover_photo,
        company_ids: [],
        brand_ids: [],
        options_attributes: [
          :id,
          :title,
          :details,
          :original_price,
          :deal_price,
          :_destroy
        ]
      )
    end
  end
end
