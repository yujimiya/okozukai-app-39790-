class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = current_user.events
    gon.marked_events = @events.where(marked: true).pluck(:help_date)  # 例として marked が true のイベントの help_date を取得
    @goal_price = current_user.try(:goal_price)
    @event = @events.first
    @total_price = @events.sum { |event| event.user.unit_price }
  end
  
  def new
    @event = Event.new
  end

  def create
    @events = current_user.events
    gon.marked_events = @events.where(marked: true ).pluck(:help_date)  # 例として marked が true のイベントの help_date を取得
    clicked_data = current_user.events.new(event_params)
    
    existing_event = @events.find_by(help_date: clicked_data)

    if existing_event
      # イベントが既に存在する場合、marked の値をトグル
      existing_event.update(marked: !existing_event.marked)
    else
      # イベントが存在しない場合、新しいイベントを作成
      @event = current_user.events.new(event_params)
      @event.marked = true
      @event.save
    end
    redirect_to events_path
  end

  def show
  end

  private 

  def event_params
    params.require(:event).permit(:user_id, :help_date, :marked)
  end
end
