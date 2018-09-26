class UserrequestController < ApplicationController
   
   def index
   	@user_request = UserRequest.new
    if params[:user_request]
    @user_request.name = params[:user_request][:name]
    @user_request.address = params[:user_request][:address]
    @user_request.village = params[:user_request][:village]
    @user_request.contact_no = params[:user_request][:contact_no]
    @user_request.email = params[:user_request][:email]
    @user_request.loss_info = params[:user_request][:loss_info]
    @user_request.loss_amount = params[:user_request][:loss_amount]
 
    if @user_request.save
       redirect_to :controller => 'welcome', :action => 'index'
    else
        render :action=>'new' 
    end
    else
      redirect_to :controller => 'userrequest', :action => 'new'
     end     
   end
   
   def new
   	@user_request=UserRequest.new
   end	

   def show
   	@temp = UserRequest.find_by contact_no: params[:q]
        if @temp
	   	if @temp.status==-1
	   		@var='Pending'
	   	elsif @temp.status==0
	   		@var='Reject'
	   	else
	   	    @var='Approved'
	    	end
        else
         flash[:msg]="No request with this number" 
         redirect_to :controller => 'userrequest', :action => 'check'    	
        end    	
   end	


   def check
   end	
  

end
