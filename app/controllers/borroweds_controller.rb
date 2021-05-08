class BorrowedsController < ApplicationController

  def new
    @borrowed = Borrowed.new
    @rental = Rental.find_by(id: params[:rental])
  end

  def confirm
    @borrowed = Borrowed.new(borrowed_params)
    @rental = Rental.find_by(id: @borrowed.property_id)
    @borrowed.user_id = session[:user_id]
    @borrowed.price = @rental.price.to_i * @borrowed.user.to_i * (@borrowed.lodgment_end  - @borrowed.lodgment_start).to_i
    if @rental.max_user < @borrowed.user || @borrowed.user <= 0
      flash[:notice] = "利用人数が適切ではありません"
      render :new
    end
    if @borrowed.price <= 0
      flash[:notice] = "適切な宿泊終了日を選択してください"
      render :new
    end
    render :new if @borrowed.invalid?
  end

  def create
    @borrowed = Borrowed.new(borrowed_params)
    if @borrowed.save
      redirect_to @borrowed
    else
      flash[:notice] = "未入力の部分があります"
      render :new
    end
  end

  private
    def borrowed_params
      params.require(:borrowed).permit(:lodgment_start, :lodgment_end, :property_id, :user, :price, :user_id)
    end
end
