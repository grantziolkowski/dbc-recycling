require 'json'
require 'open-uri'

results = JSON.parse(open("https://data.cityofnewyork.us/resource/sxx4-xhzg.json").read, symbolize_names: true)

results.each {|result| RecyclingBin.create(borough: result[:borough], address: result[:address], latitude: result[:latitude], longitude: result[:longitude])}
