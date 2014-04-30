class WeatherSourcesController < ApplicationController
  # GET /weather_sources
  # GET /weather_sources.json
  def index
    @weather_sources = WeatherSource.all

    render json: @weather_sources
  end

  # GET /weather_sources/1
  # GET /weather_sources/1.json
  def show
    @weather_source = WeatherSource.find(params[:id])

    render json: @weather_source
  end

  # POST /weather_sources
  # POST /weather_sources.json
  def create
    @weather_source = WeatherSource.new(params[:weather_source])

    if @weather_source.save
      render json: @weather_source, status: :created, location: @weather_source
    else
      render json: @weather_source.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weather_sources/1
  # PATCH/PUT /weather_sources/1.json
  def update
    @weather_source = WeatherSource.find(params[:id])

    if @weather_source.update(params[:weather_source])
      head :no_content
    else
      render json: @weather_source.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weather_sources/1
  # DELETE /weather_sources/1.json
  def destroy
    @weather_source = WeatherSource.find(params[:id])
    @weather_source.destroy

    head :no_content
  end
end
