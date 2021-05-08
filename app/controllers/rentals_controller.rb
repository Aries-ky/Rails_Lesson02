class RentalsController < ApplicationController
  before_action :set_rental, only: %i[ show edit update destroy ]

  def index
  end

  def show
  end

  def new
    @rental = Rental.new
  end

  def edit
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user_id = session[:user_id]
    if @rental.save
      redirect_to @rental, notice: "新規登録しました"
    else
      flash[:notice] = "未入力の部分があります"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @rental.update(rental_params)
        redirect_to @rental, notice: "情報を更新しました"
    else
      flash[:notice] = "未入力の部分があります"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @rental.destroy
    redirect_to rentals_url, notice: "貸し物件を削除しました"
  end

  private
    def set_rental
      @rental = Rental.find(params[:id])
    end

    def rental_params
      params.require(:rental).permit(:title, :price, :max_user, :description, :Aria, :address, :image, :user_id)
    end
end
