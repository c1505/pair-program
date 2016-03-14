class EventsController < ApplicationController
  def index
    if params[:event]
      @events = Event.where(category: params[:event]).where(guest_id: nil).order(:earliest_start)
    elsif params[:user_id]
      user = User.find(params[:user_id])
      @events = user.events + user.reservations
    else
      @events = Event.all.where(guest_id: nil)
    end
  end

  def show 
    @event = Event.find(params[:id])
    @user = User.find(@event.host_id)
    @user.availability_to_array
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    event.save
    redirect_to event
  end

  def edit 
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
  end

  def reserve
    event = Event.find(params[:id])
    event.update(guest_id: current_user.id)
    flash[:notice] = "You have a partner!  Send #{event.host.name} an email to find a time to pair"
    redirect_to event
  end

  def cancel
    event = Event.find(params[:id])
    if event.guest == current_user
      event.update(guest_id: nil)
      flash[:notice] = "Pairing canceled.  Find a session that is a better match or create your own."
      redirect_to events_path
    end
  end

  private

    def event_params
      params.require(:event).permit(:host_id, :title, :earliest_start, :latest_start, :notes, :desired_style, :category)
    end



end
