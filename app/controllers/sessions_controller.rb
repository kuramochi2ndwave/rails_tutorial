class SessionsController < ApplicationController
  def new
  end

  def create
  ## binding.pry
   user = User.find_by(email: params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password])
    flash[:success] = "ログインに成功しました"
    log_in user
    redirect_to user
   else
    flash[:danger] = "ログインに失敗しました"
    render 'new'
  end
 end
end