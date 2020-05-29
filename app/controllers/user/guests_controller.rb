class User::GuestsController < User::BaseController
  def index
    @guests = Guest.where(user_id: current_user.id)
  end

  def new
    @guest = Guest.new
    @guest.user = current_user
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.user = current_user
    @guest.save
    redirect_to user_dashboard_path
  end

  def edit
    @guest = Guest.find(params[:id])
    @guest.user = current_user
  end

  def update
    @guest = Guest.find(params[:id])
    @guest.update(guest_params)
    redirect_to user_dashboard_path
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to user_dashboard_path
  end

  private

  def guest_params
    params.require(:guest).permit(:first_name,
                                  :last_name,
                                  :phone_number,
                                  :address,
                                  :email,
                                  :additional_guest_numbers,
                                  :food_preference,
                                  :user_id)
  end


end
