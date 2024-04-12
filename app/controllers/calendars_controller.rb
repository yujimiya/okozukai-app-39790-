# class CalendarsController < ApplicationController
  
#   def new
#   end

#   def create
#     @calendar = Calendar.new(calendar_params)
#     if @calendar.save
#       ender json: { status: 'success', message: 'イベントが作成されました' }
#     else
#       render json: { status: 'error', message: 'イベントの作成に失敗しました' }, status: :unprocessable_entity
#     end
#   end

#   private

#   def event_params
#     params.require(:calendar).permit(:help_date)
#   end
# end