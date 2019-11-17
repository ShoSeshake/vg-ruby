class Api::RestaurantsController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'active_support'
  require 'active_support/core_ext'

  def search
    array = { keyid: ENV['GNAVI_KEY'],
                lang: "en",
                name: params[:name]}
    logger = Logger.new('./webapi.log')

    params = URI.encode_www_form(array)

    uri = URI.parse("https://api.gnavi.co.jp/ForeignRestSearchAPI/v3/?#{params}")
    @restaurants = []
    begin
      response = Net::HTTP.new(uri.host, uri.port).yield_self do |http|
        http.use_ssl = true
        http.open_timeout = 5
        http.read_timeout = 30
        http.get(uri.request_uri)
      end

      case response
      when Net::HTTPSuccess

        hash = JSON.parse(response.body, symbolize_names: true)

        @hash = hash[:rest]
        @hash.each do |rest|
          restaurant = {
            id: rest[:id],
            name: rest[:name][:name],
            image: rest[:image_url][:thumbnail],
            url: rest[:url],
            prefecture: rest[:location][:area][:prefname]
          }
          @restaurants << restaurant
        end
      when Net::HTTPRedirection
        logger.warn("Redirection: code=#{response.code} message=#{response.message}")
      else
        logger.error("HTTP ERROR: code=#{response.code} message=#{response.message}")
      end
    end
  end

  def detail
    array = { keyid: ENV['GNAVI_KEY'],
                lang: "en",
                id: params[:id]}

    logger = Logger.new('./webapi.log')

    params = URI.encode_www_form(array)

    uri = URI.parse("https://api.gnavi.co.jp/ForeignRestSearchAPI/v3/?#{params}")
    begin
      response = Net::HTTP.new(uri.host, uri.port).yield_self do |http|
        http.use_ssl = true
        http.open_timeout = 5
        http.read_timeout = 30
        http.get(uri.request_uri)
      end

      case response
      when Net::HTTPSuccess

        hash = JSON.parse(response.body, symbolize_names: true)

        @hash = hash[:rest]
      when Net::HTTPRedirection
        logger.warn("Redirection: code=#{response.code} message=#{response.message}")
      else
        logger.error("HTTP ERROR: code=#{response.code} message=#{response.message}")
      end
    end
  end
end