class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_role?(:agent) || current_user.has_role?(:admin)
      @tickets = Ticket.all
    else
      @tickets = current_user.tickets
    end
  end

  def pdf_report
    @last_month = Ticket.closed.in_last_month
    @current_month = Ticket.closed.in_current_month
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "pdf_report",
                 :template => 'home/pdf_report.pdf.erb',
                 :disposition => 'attachment',
                 :footer => {
                    :center => "Center",
                    :left => "Left",
                    :right => "Right"
                 }      
      end
    end

  end
  
end
