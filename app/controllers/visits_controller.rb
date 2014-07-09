class VisitsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /visits
  # GET /visits.json

  def index
    if current_user.has_role? :admin or current_user.has_role? :default or current_user.has_role? :basic or current_user.has_role? :standard or current_user.has_role? :plus or current_user.has_role? :advanced or current_user.has_role? :premier
      @visits = current_user.account.visits.scoped
    else
      @visits = current_user.visits.scoped
    end
    @visits = @visits.after(params['start']) if (params['start'])
    @visits = @visits.before(params['end']) if (params['end'])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visits }
      format.js  { render :json => @visits }
    end
  end



  # GET /visits/1
  # GET /visits/1.json
  def show
    @visit = Visit.find(params[:id])
    @json = @visit.client.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @visit }
      format.js { render :json => @visit.to_json }
    end
  end

  # GET /visits/new
  # GET /visits/new.json
  def new
    @visit = Visit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @visit }
      format.xml  { render :xml => @visit }
    end
  end

  # GET /visits/1/edit
  def edit
    @visit = Visit.find(params[:id])
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(params[:visit])

    respond_to do |format|
      if @visit.save
        format.html { redirect_to(@visit, :notice => 'Visit was successfully created.') }
        format.xml  { render :xml => @visit, :status => :created, :location => @visit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /visits/1
  # PUT /visits/1.json

  # when we drag a visit on the calendar (from day to day on the month view, or stretching
  # it on the week or day view), this method will be called to update the values.
  # viv la REST!
  def update
    @visit = Visit.find(params[:id])

    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.html { redirect_to visits_path, :notice => 'Visit was successfully updated.' }
        format.xml  { head :ok }
        format.js { head :ok}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @visit.errors, :status => :unprocessable_entity }
        format.js  { render :js => @visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to visits_url }
      format.json { head :no_content }
    end
  end
end
