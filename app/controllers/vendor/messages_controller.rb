class Vendor::MessagesController < Vendor::BaseController
  def create
    @inbox = Inbox.find(params[:inbox_id])
    @message = Message.new(message_params)
    @message.inbox = @inbox
    @message.sender = current_user
    if @message.save
      InboxChannel.broadcast_to(
        @inbox,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to vendor_inbox_path(@inbox, anchor: "message-#{@message.id}")
    else
      render "inboxes/show"
    end
  end



  private

  def message_params
    params.require(:message).permit(:content)
  end
end
