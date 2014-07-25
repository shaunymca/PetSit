class SearchesController < ApplicationController
    respond_to :html

    def index
        if params[:id] && params[:last_name]
            @invoice = Invoice.search(params[:id], params[:last_name])
            unless @invoice.nil?
                @visits = @invoice.visits.select('distinct visit_type AS vtype, AVG(visit_price) AS vprice, COUNT(*) AS count, SUM(visit_price) AS total').group('visit_type')

            end         
        end


        respond_to do |format|
            format.html 
            format.json { render json: @invoice }
            format.pdf do
            pdf = InvoicePdf.new(@invoice, @visits)
            send_data pdf.render, filename: "invoice_#{@invoice.id}",
                                  type: "application/pdf",
                                  disposition: "inline"
          end
        end
    end

    def new
        @invoice = @invoice = Invoice.find(params[:id])


    end

    def create

        @invoice = Invoice.find(params[:id])
        Stripe.api_key = @invoice.account.access_token
        customer = Stripe::Customer.create(
            :email => @invoice.client.email,
            :card  => params[:stripeToken]
          )

        charge = Stripe::Charge.create(
            :customer    => customer.id,
            :amount      => @invoice.total_price * 100,
            :description => 'PetSitters Pal Customer',
            :currency    => 'usd',
            :application_fee => (@invoice.total_price.to_f * 100 * 0.006).to_i
          )
        @invoice.paid = true
        if @invoice.save
            redirect_to searches_path(:id => @invoice.id, :last_name=>@invoice.last_name), notice: 'Payment was successfully created.' 
        end
          

        rescue Stripe::CardError => e
          flash[:error] = e.message
          redirect_to searches_path(:id => @invoice.id, :last_name=>@invoice.last_name, :commit=>'Search')

        
    end





end



