class EventMailer < ApplicationMailer

  def reminder_email(event)
    @event = event
  end
end
