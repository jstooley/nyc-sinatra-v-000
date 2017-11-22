class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/show' do
    erb :'figures/show'
  end

  post '/figures' do
    binding.pry
    redirect to 'figures/show'
  end

end
