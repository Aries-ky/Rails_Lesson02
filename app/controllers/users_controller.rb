class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to :user
    else
      flash[:notice] = "未入力の部分があります"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @rental = Rental.where(user_id: params[:id])
    @borrowed = Borrowed.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新しました"
      redirect_to :user
    else
      render "edit"
    end
  end

  def destroy   #ユーザー削除とともに物件、履歴をまとめて削除
    @user = User.find(params[:id])
    @rental = Rental.where(user_id: params[:id])
    @borrowed = Borrowed.where(user_id: params[:id])
    @user.destroy
    if @rental
      @rental.destroy
    end
    if @borrowed
      @borrowed.destroy
    end
    render "top/index"
  end

  def user_params
    params.require(:user).permit(:name, :mail, :pass, :text, :image)
  end

end
