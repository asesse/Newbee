class MessagesController < ApplicationController


  def create
    @message = Message.new(message_params)
    @message.activity_id = params[:activity_id]
    @message.user = current_user
    @message.save
    redirect_to activity_path(@message.activity, anchor: "message-#{@message.id}"), notice: "Message has been created!"
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end

end
