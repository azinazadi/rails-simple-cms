#module I18n:: Backend
#
#
#  # strings from I18n are html_safe
#  # FIXME: Stimmt das? Was ist mit Interpolationen a la:
#  # https://rails.lighthouseapp.com/projects/8994/tickets/5014-i18n-translated-strings-are-html-escaped-in-views
#  module BiLingual
#    def translate(*args)
#      #translation  = super
#      #translation.is_a?(String) ? translation.html_safe : translation
#      "TOOOTIIII"
#    end
#  end
#end
#
#I18n.available_locales = ['ar']
##I18n::Backend::Simple.send(:include,    I18n::Backend::SimpleKeyAdapter)
##I18n::Backend::KeyValue.send(:include,  I18n::Backend::KeyValueKeyAdapter)
##I18n::Backend::Chain.send(:include,     I18n::Backend::ChainKeyAdapter)
#
##[I18n::Backend::Simple, I18n::Backend::KeyValue, I18n::Backend::Chain].each do |backend|
##  backend.send(:include, BackendDumper)
##end
#
##if Rails.env.production?
##  I18n::Backend::Chain.send( :include, I18n::Backend::Cache)
##  I18n.cache_store = ActiveSupport::Cache.lookup_store(:memory_store)
##end
#
## read available locales from config and apply
##I18n.available_locales = I18n::ContentLocales = APP_CONFIG['platform']['languages'].map(&:to_sym)
#
## If there is a redis configured, we use this first and fallback to the simple (YAML) backend
##if APP_CONFIG['i18n_use_redis'] && (redis_backend = RediscoKeyValueBackendProvider.get)
##  I18n::Backend::Chain.send(:include, I18n::Backend::StatisticsMode) if APP_CONFIG["i18n_statistics_mode"]
##  I18n::Backend::Chain.send(:include, I18n::Backend::InfoMode) if APP_CONFIG["i18n_info_mode"]
##  I18n::Backend::Chain.send(:include, I18n::Backend::SafeHtml)
##  I18n::Backend::Chain.send(:include, I18n::Backend::StandardInterpolationKeys)
##
##  I18n.backend = I18n::Backend::Chain.new(
##    redis_backend,
##    I18n::Backend::Simple.new
##  )
##else
#I18n::Backend::Simple.send(:include, I18n::Backend::BiLingual)
#
#I18n.backend = I18n::Backend::Simple.new
##end
