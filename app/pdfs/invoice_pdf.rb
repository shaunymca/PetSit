class InvoicePdf < Prawn::Document
  def initialize(invoice, visits)
    super(top_margin: 70)
    @invoice = invoice
    @visits = visits
    invoice_header
    visit_items
    total_amount
  end
  
  def visit_items
    move_down 20
    table visit_item_rows do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end
  
  def visit_item_rows
    [["Visit Type", "Price per Visit", "Number of Visits", "Total"]] +
    @visits.map do |visit|
      [visit.vtype, "$" + visit.vprice.to_i.floor.to_s, visit.count, "$" + visit.total.to_s]
    end
  end
  
  def total_amount
    move_down 20
    if @invoice.paid == false
      text "Total Due: $#{@invoice.total_price}", size: 16, style: :bold
    else @invoce
      text "Total Paid: $#{@invoice.total_price}", size: 16, style: :bold
    end
  end
  
  def date_range
    move_down 10
    text "For services rendered #{@invoice.american_start_date} through #{@invoice.american_end_date}.", size: 16
  end
  
  def invoice_header
    text "#{@invoice.company_name}", size: 40, style: :bold
    text "#{@invoice.client.full_name} \nInvoice \##{@invoice.id}", size: 30, style: :bold
  end
end