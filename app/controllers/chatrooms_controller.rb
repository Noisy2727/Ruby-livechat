class ChatroomsController < ApplicationController
  def index
    @current_user = current_user
    # redirect_to '' unless @current_user
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)

    if @chatroom.save
      redirect_to @chatroom
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def chatroom_params
    params.require(:chatroom).permit(:title, :body)
  end
end
