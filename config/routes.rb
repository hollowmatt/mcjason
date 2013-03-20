MCJason::Application.routes.draw do
  # config/routes.rb

  scope "(:locale)" do
		resources :helicopters, only: :index

    match '/:locale' => "home#index"

		root :to => "home#index"
	end


end
