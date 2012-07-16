xml.instruct!
xml.Response do
  if !@route
    xml.Reject
  else
    # Check selections
    if params["Digits"]
      @script.selections.each do |selection|
        if "#{selection.digits}" == "#{params["Digits"]}"
          if selection.target_script_id
            xml.Redirect "/api.xml?script=#{selection.target_script_id}"
          elsif selection.mailbox_id
            xml.Redirect "/api/mailbox.xml"
          end
          break
        end
        if selection == @script.commands.last
          xml.Say "Invalid selection"
        end
      end
    end

    xml.Say @script.name

    if @script.has_input
      xml.Gather(:numDigits => 1) do
        xml << render(:formats => [:xml], :partial => "api/commands")
      end
    else
      xml << render(:formats => [:xml], :partial => "api/commands")
    end

    if @script.selections.count > 0
      xml.Redirect "/api.xml?script=#{@script.selections.last.target}"
    else
      xml.Redirect "/api.xml"
    end
  end
end
