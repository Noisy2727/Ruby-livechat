class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      #render json: user, status: :ok
      redirect_to root_path, notice: 'User created logged in!'
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    #head :no_content
    redirect_to root_path, notice: 'Logged out!'
  end
end