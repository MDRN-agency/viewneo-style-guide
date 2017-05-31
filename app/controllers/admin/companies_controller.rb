module Admin
  class CompaniesController < BaseController
    before_action :set_company, only: [:show, :edit, :update, :destroy]

    def index
      @companies = Company.order(id: :desc).page(params[:page])
    end

    def show
    end

    def new
      @company = Company.new
    end

    def edit
    end

    def create
      @company = Company.new(company_params)

      if @company.save
        redirect_to admin_company_path(@company), notice: 'Company was successfully created.'
      else
        render :new
      end
    end

    def update
      if @company.update(company_params)
        redirect_to admin_company_path(@company), notice: 'Company was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @company.destroy
      redirect_to admin_companies_url, notice: 'Company was successfully destroyed.'
    end

    private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(
        :name,
        :summary,
        :description,
        :industry,
        :logo,
        :thumbnail_photo,
        :year_founded,
        contacts_attributes: [
          :id,
          :first_name,
          :last_name,
          :phone_number,
          :email,
          :_destroy
        ]
      )
    end
  end
end
