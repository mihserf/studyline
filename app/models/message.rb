class Message < ActionMailer::Base
  def send_message
    recipients "gaganov@gmail.com"
    subject "Сообщение с сайта"
    from "email@mail.com"
    body 
  end
  

end
