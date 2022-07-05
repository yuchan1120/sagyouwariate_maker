# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        set_flash_message! :notice, :signed_up
        sign_in(resource_name, resource)
        create_default_works
        redirect_to :tables
      else
        render "new"
      end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to :tables
    else
      render "edit"
    end
  end

  def create_default_works
    RegularWork.create(name: "仮点検", time_required: 10, user_id: current_user.id)
    RegularWork.create(name: "温度点検", time_required: 10, user_id: current_user.id)
    RegularWork.create(name: "鮮度管理", time_required: 15, user_id: current_user.id)
    RegularWork.create(name: "売上日報", time_required: 60, user_id: current_user.id)
    RegularWork.create(name: "ATM入金", time_required: 10, user_id: current_user.id)
    RegularWork.create(name: "伝票集計", time_required: 20, user_id: current_user.id)
    RegularWork.create(name: "ストアスタンプ日付変更", time_required: 2, user_id: current_user.id)
    RegularWork.create(name: "深夜鮮度管理", time_required: 45, user_id: current_user.id)
    DeliverWork.create(name: "米飯2便納品", time_required: 30, user_id: current_user.id)
    DeliverWork.create(name: "チルド2便納品", time_required: 30, user_id: current_user.id)
    DeliverWork.create(name: "山崎パン2便納品", time_required: 10, user_id: current_user.id)
    DeliverWork.create(name: "米飯3便納品", time_required: 30, user_id: current_user.id)
    DeliverWork.create(name: "チルド3便納品", time_required: 30, user_id: current_user.id)
    DeliverWork.create(name: "オリジナルパン3便納品", time_required: 15, user_id: current_user.id)
    DeliverWork.create(name: "週3加食納品", time_required: 60, user_id: current_user.id)
    DeliverWork.create(name: "週3雑貨納品", time_required: 60, user_id: current_user.id)
    DeliverWork.create(name: "週3菓子納品", time_required: 60, user_id: current_user.id)
    DeliverWork.create(name: "米飯1便納品", time_required: 30, user_id: current_user.id)
    DeliverWork.create(name: "チルド1便納品", time_required: 60, user_id: current_user.id)
    DeliverWork.create(name: "オリジナルパン1便納品", time_required: 30, user_id: current_user.id)
    DeliverWork.create(name: "雑誌納品", time_required: 45, user_id: current_user.id)
    DeliverWork.create(name: "フローズン納品", time_required: 20, user_id: current_user.id)
    DeliverWork.create(name: "新聞納品", time_required: 15, user_id: current_user.id)
    DeliverWork.create(name: "山崎パン1便納品", time_required: 10, user_id: current_user.id)
    ProductManagementWork.create(name: "フェイスアップ", time_required: 15, user_id: current_user.id)
    ProductManagementWork.create(name: "フライヤー仕込み", time_required: 30, user_id: current_user.id)
    ProductManagementWork.create(name: "おでん仕込み", time_required: 20, user_id: current_user.id)
    ProductManagementWork.create(name: "中華まん仕込み", time_required: 10, user_id: current_user.id)
    ProductManagementWork.create(name: "商品補充：加食", time_required: 15, user_id: current_user.id)
    ProductManagementWork.create(name: "商品補充：菓子", time_required: 30, user_id: current_user.id)
    ProductManagementWork.create(name: "商品補充：雑貨", time_required: 15, user_id: current_user.id)
    ProductManagementWork.create(name: "雑誌返本", time_required: 30, user_id: current_user.id)
    ProductManagementWork.create(name: "発注：米飯", time_required: 20, user_id: current_user.id)
    ProductManagementWork.create(name: "発注：調理パン", time_required: 10, user_id: current_user.id)
    ProductManagementWork.create(name: "発注：ペストリー", time_required: 20, user_id: current_user.id)
    CleaningWork.create(name: "トイレ清掃", time_required: 15, user_id: current_user.id)
    CleaningWork.create(name: "床清掃", time_required: 10, user_id: current_user.id)
    CleaningWork.create(name: "レジカウンター清掃", time_required: 10, user_id: current_user.id)
    CleaningWork.create(name: "買い物カゴ拭き上げ", time_required: 15, user_id: current_user.id)
    CleaningWork.create(name: "店外清掃", time_required: 20, user_id: current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
