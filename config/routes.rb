Rails.application.routes.draw do |map|

  resources :departamentos

  resources :localidads
    
  resources :provincias do    
    resources :departamentos do
      resources :localidads
    end  
  end 
  
  

end