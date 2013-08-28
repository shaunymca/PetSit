class InvoicePdf < Prawn::Document
  def initialize(invoice, visits)
    super(top_margin: 70)
    @invoice = invoice
    @visits = visits
    invoice_header
    visit_items
  end
  
  def visit_items
    move_down 20
    table visit_item_rows
  end
  
  def visit_item_rows
    [["Visit Type", "Price per Visit", "Number of Visits", "Total"]] +
    @visits.map do |visit|
      [visit.vtype, "$" + visit.vprice.to_i.floor.to_s, visit.count, "$" + visit.total.to_s]
    end
  end
  
  def invoice_header
    text "#{@invoice.client.full_name} | Invoice \##{@invoice.id}", size: 30, style: :bold
  end
end