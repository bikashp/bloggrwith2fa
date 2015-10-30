class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :two_factor_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one_time_password

  CODE_DELIVERY = {
                    auth: 1,
                    sms: 2,
                    email: 3
                  }
  CODEDELIVERY_NICE = {
                        1 => "auth",
                        2 => "sms",
                        3 => "email"
                      }
  def send_two_factor_authentication_code
    case self.code_via
    when CODE_DELIVERY[:auth]
    when CODE_DELIVERY[:sms]
      # We will send SMS later.
      puts "Code SMSed:: #{self.otp_code}"
    when CODE_DELIVERY[:email]
      # We will send email later.
      puts "Code Emailed:: #{self.otp_code}"
    end
  end

end
