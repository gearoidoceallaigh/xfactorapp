AdminData.config do |config|
  config.is_allowed_to_view = lambda { return true }
  config.is_allowed_to_update = lambda { return true }
end