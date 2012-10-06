class BoardController < ApplicationController
  def index
 
     @users = User.order('name ASC').all
     @date = params[:week] ? Date.parse(params[:week]) : Date.current()
     @lundi = @date.beginning_of_week(start_day = :monday) 
     @mardi = @lundi + 1
     @mercredi = @mardi + 1
     @jeudi = @mercredi + 1
     @vendredi = @jeudi + 1
     @samedi = @vendredi + 1
     @nbr_dispos = Dispo.count(:statut_id, :conditions => ['statut_id = ?', '1'])
     
     respond_to do |format|
       format.html # index.html.erb
       format.json { render :json => @users }
       format.xls { render :xls => @users }
     end
    end
    
      def full_name
         [prenom, nom].join(" ")
       end
end
