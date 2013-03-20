MCJason::Application.routes.draw do
  # config/routes.rb

  scope "(:locale)" do
    match '/:locale' => "home#index"
  end


  root :to => "home#index"
end
