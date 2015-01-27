class SessionsController < ApplicationController
  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      respond_to do |format|
        format.html { redirect_to root_path, :notice => "Logged in successfully" }
        format.js
      end      
    else
      respond_to do |format|
        format.html { flash.now[:alert] = "Invalid login/password combination" }
        format.js
      end
      
      render :action => 'new'
    end
  end

  def destroy
    reset_session
      respond_to do |format|
        format.html { redirect_to root_path, :notice => "You have successfully logged out." }
        format.js
      end
    
    
  end
end
