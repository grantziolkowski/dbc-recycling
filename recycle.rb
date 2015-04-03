require 'json'
require 'open-uri'
require_relative 'config/environment'
require 'vine'

# def start

# end


# # user_input = long, lat
# results = JSON.parse(open("https://data.cityofnewyork.us/resource/sxx4-xhzg.json").read, symbolize_names: true)
# # puts results

# results = results.each {|result| RecylingBin.create(Borough: result[:Borough], Address: result[:Address])}


# puts results[Borough]

# kenny's geodata.round(4)

class BinController

  def initialize
    @call = JSON.parse(open("https://maps.googleapis.com/maps/api/geocode/json?address=#{prompt},+New+York,+NY").read)
  end

  def prompt
    puts "What is your street address?"
    gets.chomp.split(" ").join('+')
  end


  def get_coordinates
    inner_hash = @call.access("results.0")
    @kenny_lat = inner_hash.access("geometry.location.lat")
    @kenny_long = inner_hash.access("geometry.location.lng")
  end

  def find_bins
    @recycling_bins_array = RecyclingBin.where(latitude: @kenny_lat-0.005..@kenny_lat+0.005, longitude: @kenny_long-0.005..@kenny_long+0.005)
  end

  # def view
  #   result = @recycling_bins_array.map do |recycling_bin|
  #     @borough = recycling_bin[:borough]
  #   "#{recycling_bin[:address]}"
  #   end.join("\n")

  #   puts
  #   puts "These are the recycling bins within approximately half a mile of you in #{@borough}:"
  #   puts
  #   puts result
  # end

  def view
    result = @recycling_bins_array.map do |recycling_bin|
      @borough = recycling_bin[:borough]
      call = JSON.parse(open("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{recycling_bin[:latitude]},#{recycling_bin[:longitude]}").read)
      inner_hash = call.access("results.0")
      inner_hash.access("formatted_address").split(",")[0]
    end.join("\n")
    puts
    puts "These are the recycling bins within approximately half a mile of you in #{@borough}:"
    puts
    puts result
  end

  def run
    get_coordinates
    find_bins
    view
  end

end

bin_controller = BinController.new
bin_controller.run


