class User::InboxesController < User::BaseController
  def index
    @user = User.find(current_user.id)
    @inbox = Inbox.all
    @favorites = FavoriteVendor.where(user_id: current_user.id)
  end

  def show
    @user = User.find(current_user.id)
    @inbox = Inbox.find(params[:id])
    @message = Message.new
  end
end
