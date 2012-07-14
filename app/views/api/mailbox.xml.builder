xml.instruct!
xml.Response do
    if params["Digits"] == "1"
      xml.Redirect "/api/messages.xml"
    elsif params["Digits"] == "2"
      xml.Redirect "/api/message.xml"
    end

    xml.Gather(:numDigits => 1) do
      xml.Say "Hello #{@caller.name}"
      if @new_messages.count > 0
        xml.Say "You have #{@new_messages.count} new"
        if @new_messages.count > 1
          xml.Say "messages"
        else
          xml.Say "message"
        end
        if @saved_messages.count > 0
          xml.Say "and #{@saved_messages.count} saved"
          if @saved_messages.count > 1
            xml.Say "messages"
          else
            xml.Say "message"
          end
        end
      elsif @messages.count > 0
        xml.Say "You have #{@messages.count}"
        if @messages.count > 1
          xml.Say "messages"
        else
          xml.Say "message"
        end
      else
        xml.Say "You have no messages"
      end

      if @messages.count > 0
        xml.Say "Press 1 to play your messages."
      end

      xml.Say "Press 2 to leave a message."
    end
end
