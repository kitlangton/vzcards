require 'uri'
require 'nokogiri'
require 'net/http'

class SiliconMan

  SDSession = "4e926d2f-4bed-438f-9bd9-df276b5b87ff"

  def create_instance(template_id: , input: )
    resp = create_template(template_id: template_id)

    xml = parse_response(resp)
    add_variables_to_xml(input,xml)
    instance_id = xml['s1InstanceId']

    req = wrap_xml(xml)

    resp = HTTParty.post("http://165.254.199.10/SDSession/#{SDSession}/S1Instance/#{instance_id}/Action/Update", body: req)

    return instance_id
  end


  def create_template(template_id: )
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.request {
        xml.s1Template template_id
      }
    end

    query = Nokogiri::XML(builder.to_xml).root.to_xml

    uri = URI.parse("http://165.254.199.10/")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new("/SDSession/#{SDSession}/S1Instance/Action/Create")
    request.add_field('Content-Type', 'application/xml')
    request.body = query
    http.request(request)
  end

  private

  def wrap_xml(xml)
    "<request><content>#{xml.to_s}</content></request>"
  end

  def add_variables_to_xml(input,xml)
    content = xml.css("Variable")
    content.each do |c|
      h = c.at_css("content")
      value = input[c['name']]
      h.content = value
    end
  end

  def parse_response(resp)
    puts resp.body
    xml = Nokogiri::XML(resp.body)
    xml.at_css("Template")
  end
end
