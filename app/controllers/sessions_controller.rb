class SessionsController < ApplicationController

  def create
    user_id = User.authenticate(params[:email], params[:password])
    session[:user_id] = user_id
  end

  def destroy
    session[:user_id] = nil
  end
end
