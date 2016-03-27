class ExercismController < EventsController
  def index
    @tags = Tag.all
    if params[:event]
      @events = Event.exercism.where(category: params[:event]).where(guest_id: nil).order(:earliest_start)
    elsif params[:user_id]
      user = User.find(params[:user_id])
      @events = user.events + user.reservations
    elsif params[:tag]
      # @events = Event.exercism.tagged_with(params[:tag])
      @events = Event.tagged_with(params[:tag]).exercism
    else
      @events = Event.exercism.where(guest_id: nil)
    end

  end


end
