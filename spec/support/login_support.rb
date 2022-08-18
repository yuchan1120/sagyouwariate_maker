module LoginSupport
  def sign_in_as(user)
    visit root_path
    find('#new_user_session').click
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('#submit_login').click
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end
