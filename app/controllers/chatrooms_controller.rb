class ChatroomsController < ApplicationController
  def index
    
    # You can filter the chatrooms if there are any search parameters
    scope = Chatroom.all
    
    # Example of filtering chatrooms by title if a search query is provided
    scope = scope.where("title LIKE ?", "%#{params[:search]}%") if params[:search]
    
    # Example of ordering chatrooms by the creation date (most recent first)
    scope = scope.order(created_at: :desc)
    
    # Assign the filtered and ordered chatrooms to @chatrooms for the view
    @chatrooms = scope
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
