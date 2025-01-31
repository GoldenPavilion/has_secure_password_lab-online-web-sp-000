class SessionsController < ApplicationController

    def new
    end
    
    def create
        @user = User.find_by(name: params[:user][:name])
        
        if @user == nil || @user == ""
            redirect_to '/login'
        else
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
        end
    end

end