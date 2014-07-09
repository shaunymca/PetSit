class PrintsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if current_user.has_role? :admin or current_user.has_role? :default or current_user.has_role? :basic or current_user.has_role? :standard or current_user.has_role? :plus or current_user.has_role? :advanced or current_user.has_role? :premier
      @visits = current_user.visits.where(['"visit_date" >= (:week_start) AND "visit_date" < (:weekend)', {week_start: Chronic.parse("Last week's Sunday midnight"), weekend: Chronic.parse("This week's Sunday")}]).order(:visit_date)
      @adminvisits = current_user.account.visits.where(['"visit_date" >= (:week_start) AND "visit_date" < (:weekend)', {week_start: Chronic.parse("Last week's Sunday midnight"), weekend: Chronic.parse("This week's Sunday")}]).order(:visit_date)
    else
      @visits = current_user.visits.scoped
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @visits }
      format.js  { render :json => @visits }
    end
  end
end

