require "colorize"
require "tty-prompt"
require "rspec"
require_relative("./parts.rb")

# brands = [
#     Brand.new("Audi", "Germany")
#     Brand.new("Mercedes", "Germany")
#     Brand.new("BMW", "Germany")
#     Braand.new("Volkswagen", "Germany")
#     Brand.new("Toyota", "Japam")
#     Brand.new("Lexus", "Japan")
#     Brand.new("Infiniti", "Japan")
#     Brand.new("Holden", "Australia")
#     Brand.new("Lamborghini", "Italy")
#     Brand.new("Ferrari", "Italy")
#     Brand.new("Ford", "United States of America")
#     Brand.new("Aston Martin", "United Kingdom")
# ]

# parts = [
#     Part.new("Alternator", 120, "001", 20),
#     Part.new("Battery", 90, "002", 30),
#     Part.new("Starter Motor", 130, "003", 10),
#     Part.new("Brakes", 110, "004", 40),
#     Part.new("Distributor", 130, "005", 10),
#     Part.new("Spark Plug", 40, "006", 75),
#     Part.new("Shock Absorber", 100, "007", 15),
#     Part.new("Ignition", 90, "008", 7),
#     Part.new("Radiator", 150, "009", 5)
# ]
# $prompt = TTY::Prompt.new

# def selection_menu
#     return $prompt.select("Please select from the below menu", ["Print Inventory", "Search for a part", "Add Part", "Modify Price", "Delete Part", "Exit"])
# end
# def select_inventory
#     return print_parts
#     $parts.print_parts
# end
# def print_inventory(part_name, quantity, part_code, part_price)
#     inventory = parts.find_part(part_name, quantity, part_code, part_price*quantity)
#     inventory.print_parts
# end

# selection_menu

alternator = Part.new("Alternator", "001", 120, 20)
battery = Part.new("Battery", "002", 90, 30)
starter_motor = Part.new("Starter Motor", "003", 130, 10)
brakes = Part.new("Brakes", "004", 110, 40)
distributor = Part.new("Distributor", "005", 130, 10)
spark_plug = Part.new("Spark Plug", "006", 40, 75)
shock_absorber = Part.new("Shock Absorber", "007", 100, 15)
ignition = Part.new("Ignition", "008", 90, 7)
radiator = Part.new("Radiator", "009", 150, 5)

puts alternator
puts battery
puts radiator
puts alternator.name
