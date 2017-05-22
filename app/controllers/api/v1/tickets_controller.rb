class Api::V1::TicketsController < API::BaseController
  before_action :set_ticket, only: [:show, :update, :destroy]

  def report
    @tickets = Ticket.closed.in_last_month + Ticket.closed.in_current_month
  end

  # GET /tickets
  # GET /tickets.json
  def index
    if current_user.has_role?(:agent) || current_user.has_role?(:admin)
      @tickets = Ticket.all
    else
      @tickets = current_user.tickets
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = current_user.tickets.build(ticket_params)
    if @ticket.save
      render :show, status: :created
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    if @ticket.update(ticket_params)
      render :show, status: :ok
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:title, :description, :user_id, :status_id)
    end
end
