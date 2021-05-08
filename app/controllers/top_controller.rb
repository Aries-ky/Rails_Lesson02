class TopController < ActionController::Base
  def index
    @search = Rental.ransack(params[:q])
    @items = @search.result
  end
end
