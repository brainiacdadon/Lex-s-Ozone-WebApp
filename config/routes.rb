Rails.application.routes.draw do
  #get 'home/nyumbani'

  get 'home/zipcode'

  root 'home#nyumbani'

  post 'zipcode' => 'home#zipcode' #this points to the home zipcode controller 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
