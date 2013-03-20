class ApplicationController < ActionController::Base
	protect_from_forgery

	before_filter :set_locale

	def set_locale
		if params[:locale]
			country_and_locale = params[:locale].split('-')

			@url_locale = params[:locale]

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

	private

	def locale_mapper(country)
		hash = {
			ca: 'en_CA',
		  us: 'en_US'
		}

		hash[country.to_sym]
	end
end
