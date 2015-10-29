class TwoFactorAuthenticationsController < ApplicationController
  skip_before_filter :handle_two_factor_authentication

  def auth
    @qr_provisioning = current_user.provisioning_uri
  end

  def save_phone_no
    return if params[:phone].empty?
    current_user.phone = params[:phone]
    if current_user.save
      puts "Code SMSed:: #{current_user.otp_code}"
    end
  end

  # def enable
  #   if current_user.authenticate_otp(params[:code])
  #     redirect_to user_two_factor_authentication_path, flash: {success: "Authentication Successful!"}
  #   else
  #     redirect_to :back, flash: {error: "The code you provided is not valid."}
  #   end
  # end
end