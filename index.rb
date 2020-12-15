require "colorize"
require "colorized_string"
require "tty-prompt"
require "rspec"
$prompt = TTY::Prompt.new

def price_list(parts)
    # puts "Parts available in stock and the price per part:"
    puts "Part\t    Price"
    parts.each do |part|
        puts "#{part[:name].capitalize}: $#{part[:price]}"
    end
end

def search_part(parts)
    puts "Enter part name."
    part_name = ets.chomp
    if parts.any?{|part| part[:name] == part_name}
        puts "Part is available".green
    else
        puts "#{part_name} is not available.".red
    end
end

def add_part(parts)
    puts "Enter product name."
    part_name = gets.chomp
    puts "Enter #{part_name} price."
    part_price = gets.chomp.to_f
    part = {name: part_name, price: part_price}
    parts.push(part)
    puts "Adding #{part_name}"
end

def modify_price(parts)
    puts "Enter part name."
    part_name=gets.chomp
    if parts.any?{|part| part[:name] == part_name}
        puts "Enter #{part_name} price."
        part_price=gets.chomp.to_f
        parts.each do |part|
            if part[:name] == part_name
                part[:price] = part_price
            end
        end
        puts "#{part_name} price has been updated to $#{part_price}".green
    else
        puts "#{part_name} is an invalid input.".red
    end
    # def yes_or_no
    #     return $prompt.yes?("Do you want to go back to the main menu?")
    #     end
    #     answer = ""
    #     while answer != "Exit"
    #         answer = (y/n)
    #         case answer
    #         when "y"
    #             menu_selection
    #         else
    #             puts "Exit"
    #             system "clear"
    #     end
    # end
end



def delete_part(parts)
    puts "Enter part name."
    part_name = gets.chomp
    if parts.any?{|part| part[:name] == part_name}
        puts "Are you sure you want to delete the #{part_name}?".red + "(y/n)"
        confirm = gets.chomp
        if confirm == "y"
            parts.delete_if{|part| part[:name] == part_name}
            puts "#{part_name} has been deleted."
        else
            puts "Request has been cancelled".green
        end
    end
end


parts = [
    {name: "alternator", price: 120.0},
    {name: "battery", price: 90.0},
    {name: "starter motor", price: 130.0},
    {name: "brakes", price: 110.0},
    {name: "distributor", price: 130.0},
    {name: "spark plug", price: 40.0},
    {name: "shock absorber", price: 100.0},
    {name: "ignition", price: 90.0},
    {name: "radiator", price: 150.0}
]
$prompt = TTY::Prompt.new

def menu_selection
    return $prompt.select("Please select from the below menu",
    ["Price List", "Search for part", "Add Part", "Modify Price", "Delete Part", "Exit"])
end

answer = ""
while answer != "Exit"
    answer = menu_selection
    case answer
        when "Price List"
            price_list(parts)
        when "Search for Part"
            search_part(parts)
        when "Add part"
            add_part(parts)
        when "Modify Price"
            modify_price(parts)
        when "Delete Part"
            delete_part(parts)
        else
            puts "Exit"
            # system "clear"
        end
    end