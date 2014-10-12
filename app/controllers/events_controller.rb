class EventsController < ApplicationController
  def index
    @events = Event.all.order(date: :desc)
    @event_years = @events.group_by { |e| -e.date.year }
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    verifyAdmin
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    flash[:success] = "'#{@event.name}' has been added!"
    redirect_to event_path(@event)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)
    flash[:success] = "This event has been updated."
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "#{@event.name} has been deleted."
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:name, :date, :location,
                                    :description, :picture,
                                    :guestCost, :locked,
                                    :giveaway)
    end
end
