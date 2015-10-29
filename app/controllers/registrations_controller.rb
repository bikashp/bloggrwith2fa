class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
     "/two_factor_authenticaitons/new"
  end
end
