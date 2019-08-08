class PicksController < ApplicationController
  before_action :authenticate_user!

  def create
    @rhetoric = Rhetoric.find(params[:rhetoric_id])
    unless @rhetoric.pick?(current_user)
      @rhetoric.pick(current_user)
      @rhetoric.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @rhetoric = Pick.find(params[:id]).rhetoric
    if @rhetoric.pick?(current_user)
      @rhetoric.unpick(current_user)
      @rhetoric.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

end


