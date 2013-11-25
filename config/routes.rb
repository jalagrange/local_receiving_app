LocalReceivingApp::Application.routes.draw do

  root :to => "people#index"

  match '/receive', :to => 'people#receive'
  match '/sentitems/get_statuses', :to => 'sent_items#get_statuses'

  match ':controller(/:action(/:id(.:format)))'

   
end
