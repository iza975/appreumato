class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:user][:email].downcase)
    if user && user.authenticate(params[:user][:password])
      log_in(user)
      redirect_to root_path
    else
      flash.now[:danger] = 'Email ou senha inválidos.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
