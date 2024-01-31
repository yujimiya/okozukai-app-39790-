class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = current_user.events
    gon.marked_events = @events.where(marked: 1).pluck(:help_date)  # 例として marked が true のイベントの help_date を取得
    @goal_price = current_user.try(:goal_price)
    @event = @events.first
    @total_price = @events.sum { |event| event.user.unit_price }
  end
  
  def new
    @event = Event.new
  end

  def create
    @events = current_user.events
    gon.marked_events = @events.where(marked: 1).pluck(:help_date)  # 例として marked が true のイベントの help_date を取得
    @event  = current_user.events.new(event_params)
    @event.marked = true
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end


  private 

  def event_params
    params.require(:event).permit(:user_id, :help_date, :marked)
  end
end
