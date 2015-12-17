class UsersController < ApplicationController
  before_action :authorize, only: [:show, :index]

  def index
    @users = User.all
  end

  def show
  end

  private
    def authorize
      @user = current_user
      unless @user && @user.name == 'admin'
        redirect_to controller: 'top', action: 'index'
      end
    end
end

