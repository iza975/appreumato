class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user) # Chame o método log_in passando o usuário autenticado
      redirect_to root_path
    else
      flash.now[:danger] = 'Email ou senha inválidos'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  # Método para fazer o login do usuário
  def log_in(user)
    session[:user_id] = user.id
  end

  # Método para fazer o logout do usuário
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
