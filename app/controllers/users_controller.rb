class UsersController < ApplicationController
  before_action :validate_id, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def validate_id
    unless params[:id].match?(/\A\d+\z/)
      flash[:alert] = "유효하지 않은 사용자 ID입니다."
      redirect_to users_path
    end
  end
end
