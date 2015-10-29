class TwoFactorAuthenticationsController < ApplicationController
  skip_before_filter :handle_two_factor_authentication

  def auth
    @qr_provisioning = current_user.provisioning_uri
  end

  def enable
    if current_user.authenticate_otp(params[:code])
      redirect_to root_path, flash: {success: "Authentication Successful!"}
    else
      redirect_to :back, flash: {error: "The code you provided is not valid."}
    end
  end
end