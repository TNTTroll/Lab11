# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'number#input'

  get 'number/input'

  get 'number/view'
  get 'number/last_item'
  

  # Defines the root path route ("/")
end
