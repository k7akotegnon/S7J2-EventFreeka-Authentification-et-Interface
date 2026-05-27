class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_owner?, only: [:show]

  def show
    @user = User.find(params[:id])
    @events = Event.where(administrator: @user)
  end

  private

  def is_owner?
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:danger] = "Tu ne peux pas accéder au profil d'un autre utilisateur."
      redirect_to root_path
    end
  end
end
