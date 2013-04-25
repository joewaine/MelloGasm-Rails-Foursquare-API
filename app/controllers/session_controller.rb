class SessionController < ApplicationController
  def new

  end

  def create
    user = User.where(:email => params[:email]).first
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      authenticate
      redirect_to(home_path)
    else
      session[:user_id] = nil
    end

  end

  def destroy
    session[:user_id] = nil
    authenticate
    redirect_to(root_path)

  end
end