class AppointmentsController < ApplicationController
  before_action :checkEventStatus, except: [:show]

  def new
  	@event = Event.find(params[:event_id])
  	@appointment = @event.appointments.new
  end

  def create
    @user = currentUser
  	@event = Event.find(params[:event_id])
  	@appointment = Appointment.new
    @appointment.event_id = @event.id
    @appointment.user_id = @user.id
    @appointment.update_attributes(appointment_params)
    if @appointment.save
  	 flash[:success] = "You have signed up for this event."
  	 redirect_to event_path(@event)
    else
      flash[:error] = "You were not able to sign up for that event."
      redirect_to @event
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    @event = Event.find(@appointment.event_id)
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @event = Event.find(@appointment.event.id)
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update_attributes(appointment_params)
    flash[:success] = "Registration has been updated."
    redirect_to @appointment.event
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    flash[:notice] = "Your registration for #{@appointment.event.name} has been cancelled."
    redirect_to events_path
  end

  private
  	def appointment_params
  		params.require(:appointment).permit(:paidGuests, :freeGuest, :event_id, :user_id)
  	end

    def checkEventStatus
      currentEvent = Event.find(params[:event_id])
      if currentEvent.locked?
        flash[:notice] = "Registration for this event has closed."
        redirect_to currentEvent
      end
    end
end
