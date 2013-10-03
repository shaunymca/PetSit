class DefaultPricesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /default_prices
  # GET /default_prices.json
  def index
    @default_prices = DefaultPrice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @default_prices }
    end
  end

  # GET /default_prices/1
  # GET /default_prices/1.json
  def show
    @default_price = DefaultPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @default_price }
    end
  end

  # GET /default_prices/new
  # GET /default_prices/new.json
  def new
    @default_price = DefaultPrice.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @default_price }
    end
  end

  # GET /default_prices/1/edit
  def edit
    @default_price = DefaultPrice.find(params[:id])
  end

  # POST /default_prices
  # POST /default_prices.json
  def create
    @default_price = DefaultPrice.new(params[:default_price])

    respond_to do |format|
      if @default_price.save
        format.html { redirect_to @default_price, notice: 'Default price was successfully created.' }
        format.json { render json: @default_price, status: :created, location: @default_price }
      else
        format.html { render action: "new" }
        format.json { render json: @default_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /default_prices/1
  # PUT /default_prices/1.json
  def update
    @default_price = DefaultPrice.find(params[:id])

    respond_to do |format|
      if @default_price.update_attributes(params[:default_price])
        format.html { redirect_to @default_price, notice: 'Default price was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @default_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /default_prices/1
  # DELETE /default_prices/1.json
  def destroy
    @default_price = DefaultPrice.find(params[:id])
    @default_price.destroy

    respond_to do |format|
      format.html { redirect_to default_prices_url }
      format.json { head :no_content }
    end
  end
end
