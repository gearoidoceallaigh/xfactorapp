AdminData.config do |config|
  config.is_allowed_to_view = lambda {|controller| controller.send('logged_in?') }
  config.is_allowed_to_update = lambda {|controller| controller.send('admin_logged_in?') }
end