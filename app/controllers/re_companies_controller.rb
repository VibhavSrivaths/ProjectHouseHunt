class ReCompaniesController < ApplicationController
  before_action :set_re_company, only: [:show, :edit, :update, :destroy]

  # GET /re_companies
  # GET /re_companies.json
  def index
    @re_companies = ReCompany.all
    authorize @re_companies
  end

  # GET /re_companies/1
  # GET /re_companies/1.json
  def show
    authorize @re_company
  end

  # GET /re_companies/new
  def new
    @re_company = ReCompany.new
    authorize @re_company
  end

  # GET /re_companies/1/edit
  def edit
    authorize @re_company
  end

  # POST /re_companies
  # POST /re_companies.json
  def create
    @re_company = ReCompany.new(re_company_params)

    respond_to do |format|
      if @re_company.save
        format.html { redirect_to @re_company, notice: 'Re company was successfully created.' }
        format.json { render :show, status: :created, location: @re_company }
      else
        format.html { render :new }
        format.json { render json: @re_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /re_companies/1
  # PATCH/PUT /re_companies/1.json
  def update
    authorize @re_company
    respond_to do |format|
      if @re_company.update(re_company_params)
        format.html { redirect_to @re_company, notice: 'Re company was successfully updated.' }
        format.json { render :show, status: :ok, location: @re_company }
      else
        format.html { render :edit }
        format.json { render json: @re_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /re_companies/1
  # DELETE /re_companies/1.json
  def destroy
    authorize @re_company
    @re_company.destroy
    respond_to do |format|
      format.html { redirect_to re_companies_url, notice: 'Re company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_re_company
      @re_company = ReCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def re_company_params
      params.require(:re_company).permit(:name, :website, :addr, :size, :found_year, :synopsis)
    end
end
