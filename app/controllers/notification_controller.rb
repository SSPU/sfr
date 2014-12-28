class NotificationController < ApplicationController

  def send_message
    @message = Message.new(message_params)
    if @message.save
      NotificationMailer.delay.message_email(@message)
      render json: {message: 'success'}, status: :ok
    else
      render json: {message: 'unsuccess'}, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params[:message].permit(:name, :email, :tel, :text)
  end
end
