Cities.data_path = '../cities'

cities = Cities.cities_in_country('GB')

mcr = cities['manchester']

puts mcr.name