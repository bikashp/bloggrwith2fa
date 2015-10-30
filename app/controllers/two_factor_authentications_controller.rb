class TwoFactorAuthenticationsController < ApplicationController
  skip_before_filter :handle_two_factor_authentication

  def auth
    @qr_provisioning = current_user.provisioning_uri
    current_user.code_via = User::CODE_DELIVERY[:auth]
    current_user.save
  end

  def create
    case params[:via].to_i
    when User::CODE_DELIVERY[:sms]
      if params[:phone].empty?
        current_user.errors[:base] << "Phone no. is not valid."
      else
        current_user.phone = params[:phone]
        current_user.code_via = User::CODE_DELIVERY[:sms]
        current_user.save
        @msg = "Your phone no. is saved successfully and code is sent."
      end
    when User::CODE_DELIVERY[:email]
      current_user.code_via = User::CODE_DELIVERY[:email]
      current_user.save
      @msg = "Code is sent to your email."
    else
      current_user.errors[:base] << "Invalid value for code."
    end
    current_user.send_two_factor_authentication_code
  end

  def send_code
    current_user.send_two_factor_authentication_code
  end

end