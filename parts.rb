# class Part
#     def initialize(part_name, quantity, part_code, part_price)
#         @part_name = part_name
#         @quantity = quantity
#         @part_code = part_code
#         @part_price = part_price
#     end

#     def print_inventory
#         @parts.class
#         puts "part_name\t quantity\t part_code\t part_price"
#         @parts.each do |part|
#             part.print_inventory_format
#         end
#     end

#     def print_parts
#         parts = []
#         @parts.each do |part|
#             parts.push(part_name, quantity, part_code, part_price * quantity)
#         end
#         return parts
#     end

# end

class Part
    attr_reader :name
    def initialize(name, code, price, quantity)
        @name = name
        @code = code
        @price = price
        @quantity = quantity
    end
    # def print_inventory
    #     puts "These are the available part in stock"
    # end
    def to_s
        inventory = "We currently have in stock: #{@name}, #{@code}, $#{@price}, #{@quantity} units"
        return inventory
    end

end

