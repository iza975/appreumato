# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end
  
  def show
    # Ação para exibir o perfil do usuário
  end

  def edit
    # Ação para exibir o formulário de edição
  end

  def create
    user = User.find_by(email: params[:user][:email].downcase)
    if user && user.authenticate(params[:user][:password])
      log_in(user)
      redirect_to root_path
    else
      flash.now[:danger] = 'Email ou senha inválidos'
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Perfil atualizado com sucesso!'
    else
      render 'edit'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :gender, :disease)
  end
end
