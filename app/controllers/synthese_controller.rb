class SyntheseController < ApplicationController
  def index
    
    @dispos = Dispo.where("user_id = ?", current_user)
    @date = params[:day] ? Date.parse(params[:day]) : Time.now.in_time_zone('Paris').to_date
    @monthly = params[:month] ? Date.parse(params[:month]) : Time.now.in_time_zone('Paris').to_date
    @statuts = Statut.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @dispos }
    end
  end
end
