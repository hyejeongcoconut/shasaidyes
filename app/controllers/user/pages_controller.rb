class User::PagesController < User::BaseController
  def dashboard
    @favorites = FavoriteVendor.where(user_id: current_user.id)
  end
end
