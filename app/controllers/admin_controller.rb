class AdminController < ApplicationController
  def login
    if request.post?
      user = User.authenticate(params[:userid], params[:password] )

      if user
        session[:user_id] = user.id
        redirect_to(:action => "index")

      else
        redirect_to(:action => "login",:notice=>"Access denied")
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logout"
    redirect_to :action=>"login"
  end

  def index
  end

end
