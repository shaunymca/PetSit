class VisitBlocksController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /visit_blocks
  # GET /visit_blocks.json
  def index
    @visit_blocks = VisitBlock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visit_blocks }
    end
  end

  # GET /visit_blocks/1
  # GET /visit_blocks/1.json
  def show
    @visit_block = VisitBlock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visit_block }
    end
  end

  # GET /visit_blocks/new
  # GET /visit_blocks/new.json
  def new
    @visit_block = VisitBlock.new
    @user = current_user
    @client_prices = current_user.client_prices
    @clients = current_user.clients

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @visit_block }
    end
  end

  # GET /visit_blocks/1/edit
  def edit
    @visit_block = VisitBlock.find(params[:id])
  end

  # POST /visit_blocks
  # POST /visit_blocks.json
  def create
    @visit_block = VisitBlock.new(params[:visit_block])

    respond_to do |format|
      if @visit_block.save
        format.html { redirect_to visits_path, notice: 'Visit block was successfully created.' }
        format.json { render json: @visit_block, status: :created, location: @visit_block }
      else
        format.html { render action: "new" }
        format.json { render json: @visit_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /visit_blocks/1
  # PUT /visit_blocks/1.json
  def update
    @visit_block = VisitBlock.find(params[:id])
    @visits = Visit.all

    respond_to do |format|
      if @visit_block.update_attributes(params[:visit_block])
        format.html { redirect_to visits_path }
      else
        format.html { render action: "edit" }
        format.json { render json: @visit_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visit_blocks/1
  # DELETE /visit_blocks/1.json
  def destroy
    @visit_block = VisitBlock.find(params[:id])
    @visit_block.destroy

    respond_to do |format|
      format.html { redirect_to visit_blocks_url }
      format.json { head :no_content }
    end
  end
end
