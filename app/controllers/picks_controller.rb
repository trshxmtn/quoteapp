class PicksController < ApplicationController
  before_action :authenticate_user!

  def create
    @pick = Pick.new(user_id: current_user.id ,rhetoric_id: params[:rhetoric_id])
    @pick.save
    redirect_to("/rhetorics/#{params[:rhetoric_id]}")
  end


  def destroy
    @pick = Pick.find_by(user_id: current_user.id ,rhetoric_id: params[:rhetoric_id])
    @pick.destroy
    redirect_to("/rhetorics/#{params[:rhetoric_id]}")
  end

end


