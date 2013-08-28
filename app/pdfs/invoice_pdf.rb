class InvoicePdf < Prawn::Document
  def initialize(invoice, visits)
    super(top_margin: 70)
    @invoice = invoice
    @visits = visits
    invoice_header
    line_items
  end
  
  def line_items
    move_down 20
    table line_item_rows
  end
  
  def line_item_rows
    [["Visit Type", "Price per Visit", "Number of Visits", "Total"]] +
    @visits.map do |item|
      [visit.vtype, "$" + visit.vprice.to_i.floor, visit.count, "$" + visit.total]
    end
  end
  
  def invoice_header
    text "#{order.full_name} | Invoice \##{@order.order_number}", size: 30, style: :bold
  end
end