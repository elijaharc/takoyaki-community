require "city-state"

# sample_array = Array.new
$all_cities = Array.new
$all_cities = CS.states(:ph).keys.flat_map { |state| CS.cities(state, :ph) }

# # sample_array << philippines_cities.all.name
# # philippines_cities.name.each do |i|
# #   sample_array << philippines_cities[1]
# # end
# puts philippines_citiesname

# sample_array << CS.cities(:'00', :ph)
# sample_array << CS.cities(:'01', :ph)
# sample_array << CS.cities(:'02', :ph)
# sample_array << CS.cities(:'03', :ph)
# sample_array << CS.cities(:'04', :ph)
# sample_array << CS.cities(:'05', :ph)
# sample_array << CS.cities(:'06', :ph)
# sample_array << CS.cities(:'07', :ph)
# sample_array << CS.cities(:'08', :ph)
# sample_array << CS.cities(:'09', :ph)
# sample_array << CS.cities(:'10', :ph)
# sample_array << CS.cities(:'11', :ph)
# sample_array << CS.cities(:'12', :ph)
# sample_array << CS.cities(:'13', :ph)
# sample_array << CS.cities(:'14', :ph)
# sample_array << CS.cities(:'15', :ph)
# sample_array << CS.cities(:'40', :ph)
# sample_array << CS.cities(:'41', :ph)

# sample_array.each do |city|
#     $all_cities << city
# end


# $all_cities << sample_array


# puts CS.states(:ph).keys.flat_map { |state| CS.cities(state, :ph) }
# puts sample_array
# puts sample_array

# puts tae

# puts CS.states(:ph)
# puts sample_array