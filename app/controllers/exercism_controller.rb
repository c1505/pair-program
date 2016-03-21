class ExercismController < EventsController
  def index
    if params[:event]
      @events = Event.exercism.where(category: params[:event]).where(guest_id: nil).order(:earliest_start)
    elsif params[:user_id]
      user = User.find(params[:user_id])
      @events = user.events + user.reservations
    else
      @events = Event.exercism.where(guest_id: nil)
    end

  end


end
