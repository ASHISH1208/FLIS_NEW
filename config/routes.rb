Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "welcome/index"
  get "/guest_index" =>"welcome#guest_index"
  
  get "userrequest/index"
  post "userrequest/index"
  get "userrequest/new" =>"userrequest#new"
  get "userrequest/check" =>"userrequest#check"
  get "userrequest/show" =>"userrequest#show"

  get "villageofficer/index"=>"villageofficer#index"
  post "villageofficer/index"=>"villageofficer#index"
  get "villageofficer/login"=>"villageofficer#login"
  post "villageofficer/login"=>"villageofficer#login"
  get "villageofficer/logout"=>"villageofficer#logout"
  post "villageofficer/logout"=>"villageofficer#logout"
  get "villageofficer/approve"=>"villageofficer#approve"
  post "villageofficer/approve"=>"villageofficer#approve"
  get "villageofficer/reject"=>"villageofficer#reject"
  post "villageofficer/reject"=>"villageofficer#reject"
  get "villageofficer/generate_list"=>"villageofficer#generate_list"
  post "villageofficer/generate_list"=>"villageofficer#generate_list"


  get "admin/index"=>"admin#index"
  post "admin/index"=>"admin#index"
  get "admin/login"=>"admin#login"
  post "admin/login"=>"admin#login" 
  get "admin/logout"=>"admin#logout"
  post "admin/logout"=>"admin#logout"
  get "admin/generate_list"=>"admin#generate_list"
  post "admin/generate_list"=>"admin#generate_list"
  get "admin/check" =>"admin#check"
  post "admin/check" =>"admin#check"
  get "admin/generate_graph"=>"admin#generate_graph"
  post "admin/generate_graph"=>"admin#generate_graph"

  root "welcome#index"


end
