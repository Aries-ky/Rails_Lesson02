class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(mail: params[:session][:mail].downcase)
    if user && User.find_by(pass: params[:session][:pass].downcase)
    #if user && user.authenticate(params[:session][:password])　PASSのハッシュ化をしてる時はこっちを使う
      log_in user
      render "top/index"
    else
      flash[:notice] = "入力に誤りがあります"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    render "top/index"
  end

end
