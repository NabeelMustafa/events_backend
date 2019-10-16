  class TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :update, :destroy]
    before_action :set_event, only: [:create, :index]

    # GET /customers
    def index
      @tickets = @event.tickets
      json_response(@tickets)
    end


    # POST /customers
    def create
      @ticket = @event.tickets.create!(ticket_params)
      json_response(@ticket, :created)
    end

    # GET /customers/:id
    def show
      json_response(@ticket)
    end

    # PUT /customers/:id
    def update
      @ticket.update(ticket_params)
      json_response(@ticket, :created)
    end

    # DELETE /customers/:id
    def destroy
      @ticket.destroy
      json_response({message: "Success!"}, :destroyed)
    end

    private

    def ticket_params
      # whitelist params
      params.permit(:ticket_class, :description, :availability, :price, :event_id)
    end

    def set_event
      @event = current_user.events.find(params[:event_id])
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
  end
