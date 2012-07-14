@script.commands.each do |command|
  case command.command_type.to_s
    when "Say"
      xml.Say command.value
    when "Play"
      xml.Play command.value
    when "Redirect"
      xml.Redirect "#{command.value}"
  end
end

