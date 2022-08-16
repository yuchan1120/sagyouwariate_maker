module LoginSupport
  def sign_in_as(user)
    visit root_path
    find('#upper_right_login').click
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    find('#commit_login').click
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end
