class SearchController < ApplicationController
  def index
    if(params[:latitude] && params[:longitude])
      @resorts = Resort.by_nearest(params[:latitude].to_f, params[:longitude].to_f)
    else
      @resorts = Resort.all
    end
  end
end
