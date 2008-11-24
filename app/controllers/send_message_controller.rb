class SendMessageController < ApplicationController
  def create
    email = params[:email]
    name = params[:name]
    phone = params[:phone]
    message = params[:message]

    unless email=="" || name=="" || phone=="" || message==""
      Message.deliver_send_message(message, name, phone, email)
      flash[:notice] = 'Сообщение отправлено. Вам ответят вближайшее время на Ваш email'
      redirect_to :back
    else
      flash[:error] = 'Сообщение не отправлено. Заполните все поля.'
      redirect_to :back
    end

  end
end
