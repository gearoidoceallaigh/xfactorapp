AdminData.config do |config|
  config.is_allowed_to_view = lambda {|controller| controller.send('let_me_pass?') }
  config.is_allowed_to_update = lambda {|controller| controller.send('let_me_pass?') }
end