class ForecastsController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::ImplicitRender

  respond_to :json, :xml

    def show
      @data=[]
      @result={}

      WeatherSource.all.each do |site|
        @data.push WeatherParser.get(params[:city], site.name)
      end

      @result=ResponseFormatter.format(@data)

      respond_with(@result)
    end


end
