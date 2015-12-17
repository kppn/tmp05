class PostMailer < ApplicationMailer
  default from: "ta_kondoh@actis.co.jp"

  def post_carinfo(to, car)
    @car = car
    mail to: to, subject: "carinfo"
  end
end
