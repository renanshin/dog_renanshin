Rails.application.routes.draw do
	namespace 'api' do
  	namespace 'v1' do
  		resources :dog_walkings
  	end
  end

  root 'api/v1/dog_walkings#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
