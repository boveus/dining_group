class GoogleMapsService
  def initialize
    @api_key = ENV["google_map_key"]
    @base_url = "https://maps.googleapis.com/maps/api/distancematrix/json?"
  end

  # EXAMPLE REQUEST
  #https://maps.googleapis.com/maps/api/distancematrix/json?origins=Seattle&destinations=San+Francisco&key=YOUR_API_KEY

  def get_distance(origin, destinations)
    response = HTTParty.get("#{@base_url}origins=#{origin}&destinations=#{destinations}&key=#{@api_key}")
  end
end
