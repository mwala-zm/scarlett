if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_scarlett", domain: ""
else
Rails.application.config.session_store :cookie_store, key: "_scarlett"
end
