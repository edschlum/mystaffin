class DisposController < ApplicationController
  # GET /dispos
  # GET /dispos.json
  before_filter :authenticate_user!
  def index
    @dispos = Dispo.all
    
    @dispos = Dispo.where("user_id = ?", current_user)
    @date = params[:day] ? Date.parse(params[:day]) : Time.now.in_time_zone('Paris').to_date
    @monthly = params[:month] ? Date.parse(params[:month]) : Time.now.in_time_zone('Paris').to_date
    @statuts = Statut.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dispos }
    end
  end
  
  def statistics
    @date = params[:month] ? Date.parse(params[:month]) : Time.now.in_time_zone('Paris').to_date
    @dispos = Dispo.where(:jour => (@date.beginning_of_month)..(@date.end_of_month))
    @statuts = Statut.all
    @weekdays = [0,6]
	  @day_first = @date.at_beginning_of_month
	  @day_last = @date.at_beginning_of_month.next_month
  end
  def user_stats
    @date = params[:month] ? Date.parse(params[:month]) : Time.now.in_time_zone('Paris').to_date
    @dispos = Dispo.where(:jour => (@date.beginning_of_month)..(@date.end_of_month))
    @statuts = Statut.all
    @weekdays = [0,6]
	  @day_first = @date.at_beginning_of_month
	  @day_last = @date.at_beginning_of_month.next_month
  end
  
  def synthese
    @dispos = Dispo.where("user_id = ?", current_user)
    @date = params[:day] ? Date.parse(params[:day]) : Time.now.in_time_zone('Paris').to_date
    @monthly = params[:month] ? Date.parse(params[:month]) : Time.now.in_time_zone('Paris').to_date
    @statuts = Statut.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @dispos }
    end
  end

  # GET /dispos/1
  # GET /dispos/1.json
  def show
    @dispo = Dispo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dispo }
    end
  end

  # GET /dispos/new
  # GET /dispos/new.json
  def new
     @dispo = Dispo.new
      if params[:day]
        @dispo.jour = params[:day]
      else
        @dispo.jour = Time.current().in_time_zone('Paris')
      end

      #@dispos = Array.new(3) { @current_user.dispo.build }

      @statuts = Statut.all
        
      @date = params[:day] ? Date.parse(params[:day])  : Time.current().in_time_zone('Paris')
     
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dispo }
    end
  end

  # GET /dispos/1/edit
  def edit
    @dispo = Dispo.find(params[:id])
  end

  # POST /dispos
  # POST /dispos.json
  def create
    @date = params[:day] ? Date.parse(params[:day]) : Date.current()
    
    @dispo = Dispo.new(params[:dispo])

    respond_to do |format|
      if @dispo.save
	      if @dispo.jour.wday == 5
		      format.html { redirect_to new_dispo_path(:day => @dispo.jour.to_date+3), notice: 'OK !' }
	      else
		      format.html { redirect_to new_dispo_path(:day => @dispo.jour.tomorrow.to_date), notice: 'OK !' }
        end
        format.json { render json: @dispo, status: :created, location: @dispo }
      else
        flash[:error] = "Merci de verifier votre formulaire."
        format.html { redirect_to new_dispo_path(:day => @dispo.jour.to_date) }
        format.json { render json: @dispo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dispos/1
  # PUT /dispos/1.json
  def update
    @dispo = Dispo.find(params[:id])

    respond_to do |format|
      if @dispo.update_attributes(params[:dispo])
        format.html { redirect_to @dispo, notice: 'Dispo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dispo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispos/1
  # DELETE /dispos/1.json
  def destroy
    @dispo = Dispo.find(params[:id])
    @dispo.destroy

    respond_to do |format|
      format.html { redirect_to dispos_url }
      format.json { head :no_content }
    end
  end
end
