class ClientPriceController < ApplicationController
  before_filter :authenticate_user!
  def create
    @client_price = ClientPrice.create!(params[:client_price])
    redirect_to client_prices_url
  end

  def update
    @client_price = ClientPrice.find(params[:id])
    @client_price.update_attributes!(params[:task])
    respond_to do |format|
      format.html { redirect_to client_prices_url }
      format.js
    end
  end

  def destroy
    @client_price = ClientPrice.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to client_prices_url }
      format.js
    end
  end
end