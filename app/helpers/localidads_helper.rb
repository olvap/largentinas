module LocalidadsHelper
  def autocomplete(table)
    html =""
    html << javascript_include_tag('autocomplete')
	 html << "<input id='#{table}_name' class='autocomplete' table='#{table}' />"    
    raw html
  end
end
