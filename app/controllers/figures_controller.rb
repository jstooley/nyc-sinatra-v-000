class FiguresController < ApplicationController

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get "/figures/:id" do
    @figure = Figure.find_by(id: params[:id].to_i)
    erb :'figures/show'
  end

  get "/figures/:id/edit" do
    @figure = Figure.find_by(id: params[:id].to_i)
    erb :'figures/edit'
  end

  post '/figures' do

    @figure = Figure.create(name: params["figure"]["name"])

    if params["figure"]["title_ids"] != nil #checks that they checked a title box
      params["figure"]["title_ids"].each do |title_id|
        FigureTitle.create(figure_id: @figure.id, title_id: title_id.to_i)
      end
    end

    if params["title"]["name"] != "" #checks that they filled in a new title
      title = Title.find_or_create_by(name: params["title"]["name"])
      FigureTitle.create(figure_id: @figure.id, title_id: title.id)
    end

    if params["figure"]["landmark_ids"] != nil #checks that they checked a landmark box
      params["figure"]["landmark_ids"].each do |landmark_id|
         landmark = Landmark.find_by(id: landmark_id.to_i)
         landmark.figure = @figure
         landmark.save
      end
    end

    if params["landmark"]["name"] != "" #checks that they filled in a new landmark
      landmark = Landmark.find_or_create_by(name: params["landmark"]["name"])
      landmark.figure = @figure
      landmark.save
    end
    redirect to "figures/#{@figure.id}"
  end

  post "/figures/:id" do
    @figure = Figure.find_by(id: params[:id].to_i)
    @figure.name = params["figure"]["name"]
    

    if FigureTitle.find_by(figure_id: @figure.id) != nil #clears figuretitle table of @figures titles
      FigureTitle.find_by(figure_id: @figure.id).delete
    end

    if Landmark.find_by(figure_id: @figure.id) != nil #clears all landmark from figure
      Landmark.find_by(figure_id: @figure.id).figure_id = nil
    end


    if params["figure"]["title_ids"] != nil #checks that they checked a title box
      params["figure"]["title_ids"].each do |title_id|
        FigureTitle.find_or_create_by(figure_id: @figure.id, title_id: title_id.to_i)
      end
    end

    if params["title"]["name"] != "" #checks that they filled in a new title
      title = Title.find_or_create_by(name: params["title"]["name"])
      FigureTitle.create(figure_id: @figure.id, title_id: title.id)
    end

    if params["figure"]["landmark_ids"] != nil #checks that they checked a landmark box
      params["figure"]["landmark_ids"].each do |landmark_id|
         landmark = Landmark.find_by(id: landmark_id.to_i)
         landmark.figure = @figure
         landmark.save
      end
    end

    if params["landmark"]["name"] != "" #checks that they filled in a new landmark
      landmark = Landmark.find_or_create_by(name: params["landmark"]["name"])
      landmark.figure = @figure
      landmark.save
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

end
