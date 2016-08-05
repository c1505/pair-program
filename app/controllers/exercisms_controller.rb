class ExercismsController < EventsController
  before_action :authenticate_user!, except: [:index]

  def index
    @tags = Tag.all
    if params[:event]
      @events = Event.exercism.where(category: params[:event]).where(guest_id: nil).order(:earliest_start)
    elsif params[:user_id]
      user = User.find(params[:user_id])
      @events = user.events + user.reservations
    elsif params[:tag]
      @events = Event.tagged_with(params[:tag]).exercism
    else
      @events = Event.exercism.where(guest_id: nil)
    end
  end

  def show
    @event = Event.find(params[:id])
    @exercism = @event
    @user = User.find(@event.host_id)
    @comment = Comment.new
    @tag = Tag.new
  end

  def new
    @event = Event.new
    @event.host = current_user #do i need this?
  end

  def create
    @event = Event.new(event_params)
    @event.host = current_user
    if @event.save
      redirect_to exercism_path(@event)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    redirect_to root_path, :alert => "Access denied" unless @event.host == current_user
  end

  def update
    event = Event.find(params[:id])
    if event.host = current_user
      event.update(event_params)
      redirect_to exercism_path(event)
    else
      redirect_to :back, :alert => "Access denied."
    end
  end

  def reserve
    event = Event.find(params[:id])
    event.update(guest_id: current_user.id)
    flash[:notice] = "You have a partner!  Send #{event.host.name} an email to find a time to pair"
    redirect_to exercism_path(event)
  end

  def cancel
    event = Event.find(params[:id])
    if event.guest == current_user
      event.update(guest_id: nil)
      flash[:notice] = "Pairing canceled.  Find a session that is a better match or create your own."
      redirect_to exercisms_path
    end
  end
end
