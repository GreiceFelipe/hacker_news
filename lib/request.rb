require "uri"
require "net/http"

class Request 
    private_class_method :new

    def self.execute(endpoint)
        new(endpoint).connection
    end

    def initialize(endpoint)
        @endpoint = endpoint
    end

    def connection
        url = URI(@endpoint)

        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = request_class.new(url)

        response = https.request(request)

        JSON.parse(response.read_body) if response.read_body.present?
    end

    private

  def request_class
    @request_class ||= Net::HTTP::Get
  end
end