Rails.application.routes.draw do
  resources :toys
  patch "/toys/:id/like", to: "toys#increment_likes"
end
