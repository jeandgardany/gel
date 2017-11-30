module ApplicationHelper

	def valor_formatado(number)
	  number_to_currency number,
	    unit: "R$ ",
	    separator: ",",
	    delimiter: "."
	end
	def flash_message
    messages = ""
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]
        messages += "<p class=\"#{type}\">#{flash[type]}</p>"
      end
    }

    messages
  	end
	
end
