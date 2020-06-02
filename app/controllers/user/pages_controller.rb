class User::PagesController < User::BaseController
  def dashboard
    @user = current_user
    @favorites = FavoriteVendor.where(user_id: @user.id).all
    @guests = Guest.where(user_id: @user.id).all
  end

  def update

    @quote = Quote.find(params[:page][:id])
    @quote.update(quote_params)
    respond_to do |format|
      format.html
      format.json { render json: {quotes: @quote }}
    end
  end

  private

  def quote_params
    params.require(:page).permit(:user_id, :vendor_id,
                                 :total_price,
                                 :list_of_services,
                                 :date,
                                 :booked,
                                 :id)
  end
end
