class RepliesController < ApplicationController
  def create
    reply_params
    @reply = Reply.create(user_id: session[:user_id], message_id: @message, body: @body)

    if @reply.save!
      redirect_to "/messages/#{@message}", notice: "Answer posted"
    else
      redirect_to "/messages/#{@message}", notice: "Please try to post again"
    end
  end

  def destroy
  end

  private

  def reply_params
    @message = params[:message_id]
    @body = params[:reply][:body]
  end
end
