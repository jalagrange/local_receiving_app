LocalReceivingApp::Application.routes.draw do
  resources :people

  root :to => "people#index"

   match ':controller(/:action(/:id(.:format)))'
end
