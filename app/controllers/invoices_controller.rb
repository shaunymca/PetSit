class InvoicesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = current_user.account.invoices

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoices }
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
    @invoice = Invoice.find(params[:id])
    @visits = @invoice.visits.select('distinct visit_type AS vtype, AVG(visit_price) AS vprice, COUNT(*) AS count, SUM(visit_price) AS total').group('visit_type')
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoice }
      format.pdf do
        pdf = InvoicePdf.new(@invoice, @visits)
        send_data pdf.render, filename: "invoice_#{@invoice.id}",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /invoices/new
  # GET /invoices/new.json
  def new
    @invoice = current_user.account.invoices.new
    @account = current_user.account

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoice }
    end
  end

  # GET /invoices/1/edit
  def edit
    @invoice = Invoice.find(params[:id])
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(params[:invoice])

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render json: @invoice, status: :created, location: @invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoices/1
  # PUT /invoices/1.json
  def update
    @invoice = Invoice.find(params[:id])

    respond_to do |format|
      if @invoice.update_attributes(params[:invoice])
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end


  

end
