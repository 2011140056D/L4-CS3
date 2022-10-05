class TopController < ApplicationController
    def main
       if session[:login_uid]
           render "main"
       else
           render "login"
       end
    end
    
    def login
        #puts BCrypt::Password.new(params[:pass])
        id = User.find_by(uid: params[:uid])
        a = BCrypt::Password.new(id.pass)
        if a == params[:pass]
            session[:login_uid] = params[:uid]
            redirect_to root_path
        else
            render "error"
        end
    end
    
    def logout
       session.delete(:login_uid)
       redirect_to root_path
    end
end
