require 'uri'
require 'net/http'

class SiliconMan

  SDSession = "4e926d2f-4bed-438f-9bd9-df276b5b87ff"

  def instance(template_id: , input: )
    resp = generate_template(template_id: template_id)

    xml = Nokogiri::XML(resp.body)
    xml = xml.at_css("Template")
    content = xml.css("Variable")
    content.each do |c|
      h = c.at_css("content")
      h.content = input
    end

    instance_id = xml['s1InstanceId']

    xml = "<request><content>#{xml.to_s}</content></request>"

    resp = HTTParty.post("http://165.254.199.10/SDSession/#{SDSession}/S1Instance/#{instance_id}/Action/Update", body: xml)

    return instance_id
  end

  private

  def generate_template(template_id: template_id)
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

end
