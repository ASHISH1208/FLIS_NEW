class AdminController < ApplicationController
	def login
	  if(session[:a_user_id])
        redirect_to :controller => "admin", :action => "index"
      end  
	end
	
	def logout
		reset_session
        redirect_to :controller => "welcome", :action => "index"
	end

	def index
	 if(!session[:a_user_id])
       begin 
        @admin = Admin.find(params[:user_id])
        rescue ActiveRecord::RecordNotFound
         flash[:msg]="User Name not exist"  
        redirect_to :controller => "admin", :action => "login"
        return
       end
       if(@admin.password == params[:password])
        reset_session
        session[:a_user_id] = @admin.name 
       else
        flash[:msg]="Wrong Password"
        redirect_to :controller => "admin", :action => "login"
       end
     else
       @admin = Admin.find(session[:a_user_id])
     end
	end


	def check
	  if(!session[:a_user_id])
  		redirect_to :controller => 'admin', :action => 'login'
  	  else
  		@officer = Admin.find(session[:a_user_id])
  	  end	
	end	

	
	def generate_list
          if(!session[:a_user_id])
  		redirect_to :controller => 'admin', :action => 'login'
  	  else
  		@admin = Admin.find(session[:a_user_id])
  	  end

  	  @temp = UserRequest.where("village= '#{params[:q]}' AND status=1") 
          if @temp.size ==0
           flash[:msg]="No Record exist"
           redirect_to :controller => 'admin',:action=>'check'
          end  
	
	end


  def generate_graph
      if(!session[:a_user_id])
       redirect_to :controller => 'admin', :action => 'login'
      else
       @admin = Admin.find(session[:a_user_id])
      end

  end  
		
end
