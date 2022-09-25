class Users::RegistrationsController < Devise::RegistrationsController
  include Common

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_flash_message! :notice, :signed_up
      sign_in(resource_name, resource)
      create_default_works
      create_default_table
      redirect_to :tables
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
