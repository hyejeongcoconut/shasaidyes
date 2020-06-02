class User::InboxesController < User::BaseController
  def index
    @inbox = Inbox.all
  end

  def show
    @inbox = Inbox.find(params[:id])
    @message = Message.new
  end
end
