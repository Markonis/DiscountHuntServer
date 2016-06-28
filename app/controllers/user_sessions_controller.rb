class UserSessionsController < ApplicationController
  before_action :set_user_session, only: :update

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    user = query_user

    if user.present?
      @user_session = UserSession.new(user: user)
    end

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to @user_session, notice: 'User session was successfully created.' }
        format.json { render :show, status: :created, location: @user_session }
      else
        format.html { render :new }
        format.json { render json: @user_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_sessions/1
  # PATCH/PUT /user_sessions/1.json
  def update
    respond_to do |format|
      if @user_session.update(user_session_params)
        format.html { redirect_to @user_session, notice: 'User session was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_session }
      else
        format.html { render :edit }
        format.json { render json: @user_session.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_session
      @user_session = UserSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_session_params
      params.require(:user_session).permit(:username, :password)
    end

    def query_user
      User.by_credentials(user_session_params[:username],
        user_session_params[:password])
    end
end
