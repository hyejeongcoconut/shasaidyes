class InboxChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    inbox = Inbox.find(params[:id])
    stream_for inbox
  end

end
