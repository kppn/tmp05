class TopController < ApplicationController
  before_action :ownership, only: [:show]

  # GET /cars
  # GET /cars.json
  def index
    @user = current_user
    @owners = Owner.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def ownership
      @car = Owner.find(params[:id])
    end
end
