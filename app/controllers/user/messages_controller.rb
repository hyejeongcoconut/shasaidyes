class User::MessagesController < User::BaseController
  def create
    @inbox = Inbox.find(params[:inbox_id])
    @message = Message.new(message_params)
    @message.inbox = @inbox
    @message.sender = current_user
    if @message.save
      redirect_to user_inbox_path(@inbox, anchor: "message-#{@message.id}")
    else
      render "inboxes/show"
    end
  end

  # InboxChannel.broadcast_to(
  #   @inbox,
  #   render_to_string(partial: "message", locals: { message: @message })
  # )

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
