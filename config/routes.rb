# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users
  # Application
  root to: 'home#index'

  # Contact
  scope "(:locale)", locale: /en|pt|es/ do
    resources :contacts
  end

  # Admin
  scope "(:locale)", locale: /en|pt|es/ do
    namespace :dashboard do
      get '', to: 'home#index'
    end
  end
end
