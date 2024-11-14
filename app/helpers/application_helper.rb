module ApplicationHelper
  def link_to_active_class(name, active_class_names, options = {}, html_options = {}, &block)
    html_options[:class] = html_options[:class].to_s + active_class_names if current_page?(options.to_s)
    link_to name, options, html_options, &block
  end

  def apiImgHelper
    url = URI.parse("https://foodish-api.com/api/")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = http.request(request)

    data = JSON.parse(response.body)

    @imgData = data["image"]
  end
end
