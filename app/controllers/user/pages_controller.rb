class User::PagesController < User::BaseController
  def dashboard
    @user = current_user
    @favorites = FavoriteVendor.where(user_id: @user.id).all
    @guests = Guest.where(user_id: @user.id).all
  end

  def update

    @quote = Quote.find(params[:page][:id])

    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @quote.list_of_services,
          amount: @quote.total_price,
          currency: 'usd',
          quantity: 1
        }],
        success_url: user_inboxes_url,
        cancel_url: user_inboxes_url
      )

    params_stripe = quote_params
    params_stripe[:checkout_session_id] = session.id
    @quote.update(params_stripe)

    respond_to do |format|
      format.html
      format.json { render json: {quotes: @quote }}
    end
  end

  def show_invoice
    @user = current_user
    @purchase_data = Quote.find_by(id: params[:quote_id].to_i)
  end


  private

  def quote_params
    params.require(:page).permit(:user_id, :vendor_id,
                                 :total_price,
                                 :list_of_services,
                                 :date,
                                 :booked,
                                 :id,
                                 :checkout_session_id)
  end
end
