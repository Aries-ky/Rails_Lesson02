class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_search

  private
    # ログイン済みユーザーかどうか確認
    # before_action :logged_in_user, only:[:edit, :update, :destroy]
  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

  def set_search
    @search = Rental.ransack(params[:q])
    @items = @search.result(distinct: true)
  end

end
