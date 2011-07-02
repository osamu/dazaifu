class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize , :except => :login

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "You must Login"
      redirect_to :controller => 'admin', :action => 'login'
    end
  end
end


