class Message < ActionMailer::Base

  def send_message(message, name, phone, email)
    recipients "gaganov@gmail.com"
    subject "Сообщение с сайта"
    from "email@mail.com"
    body ({:message => message, :name => name, :phone => phone})
    content_type 'text/html'
  end
  

end
