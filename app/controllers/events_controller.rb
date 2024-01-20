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

    if @event.save#単価を設定してもカウントされないようにしたい
      redirect_to events_path
    else
      render :new
    end
  end

  def show
  end

  private 

  def event_params
    params.require(:event).permit(:unit_price)
  end
end
