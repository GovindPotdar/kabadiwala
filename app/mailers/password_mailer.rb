class PasswordMailer < ApplicationMailer
  

  def new_password_email
    @user = params[:user]
    @set_new_password = edit_users_password_url(@user.reset_password_token)
    mail(to: @user.email, subject: "Set New Password | Kabadiwala | #{DateTime.now.to_s}")
  end

end
