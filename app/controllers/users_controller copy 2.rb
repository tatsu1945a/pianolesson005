class UsersController < ApplicationController
  def new
    require 'date'

    @user = User.new
    @user.lesson_kaisu = 0
    @user.join_date = Date.today
    @user.lesson_nobekaisu = 0

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
    
  end

  private
  ##def user_params
  ##  params.require(:user).permit(:username, :email)
  ##end
  def user_params
    ##params.require(:user).permit(:username, :email, :password, :password_confirmation)
    params.require(:user).permit(:username, :email, :address, :lesson_styles_id,
                                 :level_kibous_id, :level_kakuteis_id, :fee_howtos_id, :pinano_owned_id, :pinano_histories_id,
                                 :kanji_name, :name_kana, :firstname, :lastname, :email2, :age, :zip_code, 
                                 :mobile_phone, :emagency_phone, :emagency_name, :emagency_kana, 
                                 :emagency_zokugara, :lesson_kaisu, :lesson_nobekaisu, :join_date,
                                 :password, :password_confirmation)
  end
end
