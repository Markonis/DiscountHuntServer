class FriendsRankingsController < ApplicationController
  before_action :check_user_session
  before_action :set_friends_ranking, only: [:show, :edit, :update, :destroy]

  # GET /friends_rankings
  # GET /friends_rankings.json
  def index
    @friends_rankings = FriendsRanking.all
  end

  # GET /friends_rankings/1
  # GET /friends_rankings/1.json
  def show
  end

  # GET /friends_rankings/new
  def new
    @friends_ranking = FriendsRanking.new
  end

  # GET /friends_rankings/1/edit
  def edit
  end

  # POST /friends_rankings
  # POST /friends_rankings.json
  def create
    @friends_ranking = FriendsRanking.new(friends_ranking_params)

    respond_to do |format|
      if @friends_ranking.save
        format.html { redirect_to @friends_ranking, notice: 'Friends ranking was successfully created.' }
        format.json { render :show, status: :created, location: @friends_ranking }
      else
        format.html { render :new }
        format.json { render json: @friends_ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends_rankings/1
  # PATCH/PUT /friends_rankings/1.json
  def update
    respond_to do |format|
      if @friends_ranking.update(friends_ranking_params)
        format.html { redirect_to @friends_ranking, notice: 'Friends ranking was successfully updated.' }
        format.json { render :show, status: :ok, location: @friends_ranking }
      else
        format.html { render :edit }
        format.json { render json: @friends_ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends_rankings/1
  # DELETE /friends_rankings/1.json
  def destroy
    @friends_ranking.destroy
    respond_to do |format|
      format.html { redirect_to friends_rankings_url, notice: 'Friends ranking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friends_ranking
      @friends_ranking = FriendsRanking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friends_ranking_params
      params.require(:friends_ranking).permit(:user_id)
    end
end
