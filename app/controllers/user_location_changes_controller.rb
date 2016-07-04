class UserLocationChangesController < ApplicationController
  before_action :check_user_session
  before_action :set_user_location_change, only: [:show, :edit, :update, :destroy]

  # GET /user_location_changes
  # GET /user_location_changes.json
  def index
    @user_location_changes = UserLocationChange.all
  end

  # GET /user_location_changes/1
  # GET /user_location_changes/1.json
  def show
  end

  # GET /user_location_changes/new
  def new
    @user_location_change = UserLocationChange.new
  end

  # GET /user_location_changes/1/edit
  def edit
  end

  # POST /user_location_changes
  # POST /user_location_changes.json
  def create
    @user_location_change = UserLocationChange.new(user_location_change_params)

    respond_to do |format|
      if @user_location_change.save
        format.html { redirect_to @user_location_change, notice: 'User location change was successfully created.' }
        format.json { render :show, status: :created, location: @user_location_change }
      else
        format.html { render :new }
        format.json { render json: @user_location_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_location_changes/1
  # PATCH/PUT /user_location_changes/1.json
  def update
    respond_to do |format|
      if @user_location_change.update(user_location_change_params)
        format.html { redirect_to @user_location_change, notice: 'User location change was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_location_change }
      else
        format.html { render :edit }
        format.json { render json: @user_location_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_location_changes/1
  # DELETE /user_location_changes/1.json
  def destroy
    @user_location_change.destroy
    respond_to do |format|
      format.html { redirect_to user_location_changes_url, notice: 'User location change was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_location_change
      @user_location_change = UserLocationChange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_location_change_params
      params.require(:user_location_change).permit(:user_id, location_attributes: [:lat, :lng])
    end
end
