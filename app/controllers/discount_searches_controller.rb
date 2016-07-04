class DiscountSearchesController < ApplicationController
  before_action :check_user_session
  before_action :set_discount_search, only: [:show, :edit, :update, :destroy]

  # GET /discount_searches
  # GET /discount_searches.json
  def index
    @discount_searches = DiscountSearch.all
  end

  # GET /discount_searches/1
  # GET /discount_searches/1.json
  def show
  end

  # GET /discount_searches/new
  def new
    @discount_search = DiscountSearch.new
  end

  # GET /discount_searches/1/edit
  def edit
  end

  # POST /discount_searches
  # POST /discount_searches.json
  def create
    @discount_search = DiscountSearch.new(discount_search_params)

    respond_to do |format|
      if @discount_search.save
        format.html { redirect_to @discount_search, notice: 'Discount search was successfully created.' }
        format.json { render :show, status: :created, location: @discount_search }
      else
        format.html { render :new }
        format.json { render json: @discount_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discount_searches/1
  # PATCH/PUT /discount_searches/1.json
  def update
    respond_to do |format|
      if @discount_search.update(discount_search_params)
        format.html { redirect_to @discount_search, notice: 'Discount search was successfully updated.' }
        format.json { render :show, status: :ok, location: @discount_search }
      else
        format.html { render :edit }
        format.json { render json: @discount_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discount_searches/1
  # DELETE /discount_searches/1.json
  def destroy
    @discount_search.destroy
    respond_to do |format|
      format.html { redirect_to discount_searches_url, notice: 'Discount search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount_search
      @discount_search = DiscountSearch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discount_search_params
      params.require(:discount_search).permit(:query, :result, :user_id,
        :by_friends_of, location_attributes: [:lat, :lng, :radius])
    end
end
