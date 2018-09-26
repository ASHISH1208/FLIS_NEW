class VillageofficerController < ApplicationController
  def login
    if(session[:a_user_id])
      redirect_to :controller => "villageofficer", :action => "index"
    end
  end


  def logout
    reset_session
    redirect_to :controller => "welcome", :action => "index"
  end


  def index
  	if(!session[:a_user_id])
      begin 
        @officer = VillageOfficer.find(params[:user_id])
        rescue ActiveRecord::RecordNotFound
        flash[:msg]="Village does not exist"  
        redirect_to :controller => "villageofficer", :action => "login"
        return
      end
      if(@officer.password == params[:password])
        reset_session
        session[:a_user_id] = @officer.village 
      else
        flash[:msg]="Wrong Password"
        redirect_to :controller => "villageofficer", :action => "login"
      end
    else
      @officer = VillageOfficer.find(session[:a_user_id])
    end

    @pending_requests = UserRequest.where("status = -1 AND village='#{@officer.village}'")
  end


  def approve
    @user_request = UserRequest.find(params[:request_id])
    @user_request.status = 1
    @user_request.save
    redirect_to :controller => 'villageofficer', :action => 'index'
  end


  def reject
    @user_request = UserRequest.find(params[:request_id])
    @user_request.status = 0
    @user_request.save
    redirect_to :controller => 'villageofficer', :action => 'index'
  end

  def generate_list
  	if(!session[:a_user_id])
  		redirect_to :controller => 'villageofficer', :action => 'login'
  	else
  		@officer = VillageOfficer.find(session[:a_user_id])
  	end	
       @approved_requests = UserRequest.where("status = 1 AND village='#{@officer.village}'")
  end	


end
