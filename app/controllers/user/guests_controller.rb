class User::GuestsController < User::BaseController
  def index
    @guests = Guest.where(user_id: current_user.id)
  end

  def new
    @user = User.find(params[:user_id])
    @guest = Guest.new
    @guest.user = @user
  end

  def create
    @guest = Guest.new(guest_params)
    @user = User.find(params[:user_id])
    @guest.user = @user
    @guest.save
    redirect_to user_guests_path
  end

  def edit
    @user = User.find(params[:user_id])
    @guest = Guest.find(params[:id])
    @guest.user = @user
  end

  def update
    @guest = Guest.find(params[:id])
    @guest.update(guest_params)
    redirect_to user_guests_path
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to user_guests_path
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
