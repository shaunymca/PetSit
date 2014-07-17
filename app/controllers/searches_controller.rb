class SearchesController < ApplicationController
    respond_to :html

    def index
        if params[:id] && params[:last_name]
            @invoice = Invoice.search(params[:id], params[:last_name])
            @visits = @invoice.visits.select('distinct visit_type AS vtype, AVG(visit_price) AS vprice, COUNT(*) AS count, SUM(visit_price) AS total').group('visit_type')
        end


        respond_to do |format|
            format.html 
            format.json { render json: @invoces }
        end
    end

end



