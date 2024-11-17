class ChatroomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to "pages#home" unless @current_user
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

  def destroy
    @article = Chatroom.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def chatroom_params
    params.require(:chatroom).permit(:title, :body, :owner)
  end
end
