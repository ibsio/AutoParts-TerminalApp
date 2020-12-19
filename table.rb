require "tabulo"
require "tty-table"
require "tty-font"


# $table = TTY::Table.new(["Part Name", "Stock"], [["", ""], ["", ""]])


# def inventory(parts)
#     # puts "Part\t    Stock"
#     # puts table
#     parts.each_with_index do |part|
#          parts.push "#{part[:name].capitalize} : #{part[:quantity]}"
#          puts $table(row, column)
#     end
#     return inventory(parts)
# end





# parts = [
#     {name: "alternator", quantity: 120},
#     {name: "battery", quantity: 90},
#     {name: "starter motor", quantity: 130},
#     {name: "brakes", quantity: 110},
#     {name: "distributor", quantity: 130},
#     {name: "spark plug", quantity: 40},
#     {name: "shock absorber", quantity: 100},
#     {name: "ignition", quantity: 90},
#     {name: "radiator", quantity: 150}
# ]

# $table = TTY::Table.new(["Part Name", "Stock"], [["", ""], ["", ""]])

# def table_format(parts)
#     parts.each_with_index do |part, index|
#     puts $table << "#{part[:name].capitalize} : #{part[:quantity]}"
#     end
#     return $table
# end

# puts table_format(parts)




# def table_format(parts)
#     parts.each_with_index do |part, index|
#         puts "#{part[:name].capitalize}: #{part[:quantity]}"
#     end
#     return
# end


# # inventory(parts)
# puts $table.render(:ascii)
 
# table_format(parts)

# table = Tabulo::Table.new(parts) do |part|
#     part.add_column("Part Name") { |part, row| row }
#     part.add_column("Stock", &:itself)
#   end

#   puts table

# font = TTY::Font.new(:block)
# puts font.write("IBSIO")
# font = TTY::Font.new(:standard)
# puts font.write("IBSIO")
# font = TTY::Font.new(:starwars)
# puts font.write("IBSIO")
# font = TTY::Font.new(:straight)
# puts font.write("IBSIO")
font = TTY::Font.new(:doom)
puts font.write("WELCOME  TO")
puts font.write("AUTO   PARTS")
