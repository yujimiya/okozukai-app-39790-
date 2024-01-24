class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = current_user.events
    @total_price = @events.sum(:unit_price)
    @goal_price = current_user.try(:goal_price)
  end
  
  def new
    @event = Event.new
  end

  def create
      @event = current_user.events.build(event_params)
      @event.virtual_unit_price = params[:event][:virtual_unit_price]

    if @event.save
      render turbo_stream: [
        turbo_stream.replace(@event, partial: "events/event", locals: { event: @event }),
        turbo_stream.redirect_to(events_path)
      ]
    else
      render :new
    end
  end

  def show
  end

  private 

  def event_params
    params.require(:event).permit(:virtual_unit_price)
  end
end
