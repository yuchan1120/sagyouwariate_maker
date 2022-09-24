class TopController < ApplicationController
  include Common
  layout 'top'

  def top
    redirect_to tables_path if user_signed_in?
  end

  def usage
    authenticate_user!
  end

  def guest_sign_in
    user = User.create(name: 'ゲスト', email: 'k#av92rfgagv@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    user.update(email: "k#av9#{user.id}2rfgagv@example.com")
    sign_in user
    create_default_works
    create_default_table
    redirect_to new_table_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
