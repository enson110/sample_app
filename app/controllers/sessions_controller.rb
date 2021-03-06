class SessionsController < ApplicationController
  def new
  end

  # def create
  #   user = User.find_by(email: params[:session][:email].downcase)
  #   if user && user.authenticate(params[:session][:password])
  #     sign_in user
  #     redirect_to user
  #   else
  #     flash[:error] = 'Invalid email/password combination'
  #     # render 'new'
  #     redirect_to signin_path
  #   end
  # end


   def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_back_or user
    else
      flash[:error] = 'Invalid email/password combination'
      # render 'new'
      redirect_to signin_path
    end
  end 

  def destroy
    sign_out
    redirect_to root_path
  end
end
