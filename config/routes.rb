# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  # Application
  root to: 'home#index'

  # Contact
  scope "(:locale)", locale: /en|pt|es/ do
    get 'contact', to: 'contact#index', as: :contact
    post 'contact', to: 'contact#create', as: :contact_send
  end

  # Admin
  scope "(:locale)", locale: /en|pt|es/ do
    namespace :dashboard do
      get '', to: 'home#index'
    end
  end
end
