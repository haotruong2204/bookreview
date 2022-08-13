Rails.application.routes.draw do
  # require 'sidekiq/web'

  # mount Ckeditor::Engine => "/ckeditor"
  # mount Rswag::Ui::Engine => "/api/docs"
  # mount Rswag::Api::Engine => "/api/docs"
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # mount Sidekiq::Web => "/sidekiq"
  
  root "dashboards#home_page"
  get :skill, to: "dashboards#skill"

  # namespace :admin do
  #   root "dashboard#index"

  #   devise_for :admins, path: "", path_names: { sign_in: "login", sign_out: "logout" },
  #     skip: [:registrations, :passwords]

  #   resources :posts do
  #     member do
  #       delete :delete_image_attachment
  #       get :copy
  #     end
  #   end
  #   resources :tags
  #   resources :categories do
  #     member do
  #       delete :delete_image_attachment
  #     end
  #   end

  #   resources :reports, only: :index
  # end

  # namespace :api do
  #   namespace :v1 do
  #     resources :posts, only: [:index, :show] do
  #       collection do
  #         get :slugs
  #         get :preview
  #       end

  #       member do
  #         get :track_views
  #       end
  #     end
  #     resources :categories, only: :index
  #     resources :reports, only: :create

  #     get :subscribed, to: "subscribe#subscribed"
  #     get :unsubscribe, to: "subscribe#unsubscribe"
  #     get :confirm_subscribed, to: "subscribe#confirm_subscribed"
  #   end
  # end
end
