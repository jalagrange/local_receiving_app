LocalReceivingApp::Application.routes.draw do

  root :to => "people#index"

  match '/receive', :to => 'people#receive'

   match ':controller(/:action(/:id(.:format)))'

   
end
