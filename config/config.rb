Littlebirdy::Application.configure do
  config.site_url = "http://phone.jbussdieker.com"
  config.twilio_sid = ENV["TWILIO_SID"]
  config.twilio_token = ENV["TWILIO_TOKEN"]
end
