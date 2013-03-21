class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :set_locale

  private

    def set_locale
      if params[:locale]
        country_and_locale = params[:locale].split('-')

        @url_locale = params[:locale]
        language = extract_locale_from_accept_language_header
        #country = ''
        #Geoip::Location.find_by_ip(request.remote_ip) do |location|
        #  country = location.country
        #end
        #locale = [language, country].join("_")
        #puts "locale is #{locale}"
        #binding.pry
        if country_and_locale.length > 1

          locale = params[:locale].gsub('-','_')
        else
          country = country_and_locale.first
          locale = locale_mapper(country) || ''
        end

        if I18n.available_locales.include?(locale.to_sym)
          I18n.locale = locale
        else
          I18n.locale = I18n.default_locale
          @url_locale = ''
          flash.now[:error] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end

    end


    def default_url_options(options={})
      @url_locale.present? ? {:locale => @url_locale} : {}
    end

    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end

    def locale_mapper(country)
      hash = {
        ca: 'en_CA',
        us: 'en_US'
      }

      hash[country.to_sym]
    end
end
