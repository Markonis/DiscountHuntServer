class DiscountVotesController < ApplicationController
  before_action :set_discount_vote, only: [:show, :edit, :update, :destroy]

  # GET /discount_votes
  # GET /discount_votes.json
  def index
    @discount_votes = DiscountVote.all
  end

  # GET /discount_votes/1
  # GET /discount_votes/1.json
  def show
  end

  # GET /discount_votes/new
  def new
    @discount_vote = DiscountVote.new
  end

  # GET /discount_votes/1/edit
  def edit
  end

  # POST /discount_votes
  # POST /discount_votes.json
  def create
    @discount_vote = DiscountVote.new(discount_vote_params)

    respond_to do |format|
      if @discount_vote.save
        format.html { redirect_to @discount_vote, notice: 'Discount vote was successfully created.' }
        format.json { render :show, status: :created, location: @discount_vote }
      else
        format.html { render :new }
        format.json { render json: @discount_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discount_votes/1
  # PATCH/PUT /discount_votes/1.json
  def update
    respond_to do |format|
      if @discount_vote.update(discount_vote_params)
        format.html { redirect_to @discount_vote, notice: 'Discount vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @discount_vote }
      else
        format.html { render :edit }
        format.json { render json: @discount_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discount_votes/1
  # DELETE /discount_votes/1.json
  def destroy
    @discount_vote.destroy
    respond_to do |format|
      format.html { redirect_to discount_votes_url, notice: 'Discount vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount_vote
      @discount_vote = DiscountVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discount_vote_params
      params.require(:discount_vote).permit(:user_id, :discount_id)
    end
end
