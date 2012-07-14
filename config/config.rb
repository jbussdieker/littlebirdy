Littlebirdy::Application.configure do
  config.twilio_sid = ENV["TWILIO_SID"]
  config.twilio_token = ENV["TWILIO_TOKEN"]
end
