xml.instruct!
xml.localidads do
@localidads.each do |localidad|
    xml.localidad do
      xml.id localidad.id
      xml.name "#{localidad.name} #{localidad.dname}"       
    end
  end
end