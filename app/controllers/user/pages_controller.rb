class User::PagesController < User::BaseController
  def dashboard
    @user = current_user
    @favorites = FavoriteVendor.where(user_id: @user.id).all
    @guests = Guest.where(user_id: @user.id).all
  end
end
