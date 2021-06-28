class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @user = User.find(session[:user_id])
    @message = @user.messages.create(message_params)

    if @message.save!
      redirect_to '/messages/index', notice: "Question posted"
    else
      redirect_to '/messages/index', notice: "Please try to post again"
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])

    if @message.update(message_params)
      redirect_to '/messages/index', notice: "Successfully Updated"
    else
      render :edit, notice: "Please try again"
    end
  end

  private

  def message_params
    params.permit(:title, :body)
  end
end
