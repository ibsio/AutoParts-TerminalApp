require "colorize"
require "colorized_string"
require "tty-prompt"
require "rspec"
$prompt = TTY::Prompt.new

def inventory(parts)
    puts "Part\t    Stock"
    parts.each do |part|
        puts "#{part[:name].capitalize}: #{part[:quantity]}"
    end
end

def search_part(parts)
    puts "Enter part name."
    part_name = gets.chomp
    if parts.any?{|part| part[:name] == part_name}
        puts "#{part_name.capitalize} are available. Quantity available in stock is:".green
        parts.each do |part|
            if part[:name] == part_name
                puts part[:quantity]
            end
        end
    else
        puts "#{part_name} is not available.".red
    end
end

def add_part(parts, part_name)
        part_name == ""
        puts "Enter part name."
        part_name = gets.chomp
        puts "Enter #{part_name} received quantity."
        received_quantity = gets.chomp.to_i
        part = {name: part_name, quantity: received_quantity}
        parts.push(part)
        puts "#{received_quantity} #{part_name} has been added as a new part in stock".green
        sleep(2)
        puts "Print inventory? (y/n)"
        answer=gets.chomp
        if answer == "y"
        inventory(parts)
        else
            system "clear"
        end
            #yes_or_no
            yn = $prompt.yes?("Do you want to go back to the main menu?")

            if yn #if answer is Yes
                return ""
                #menu_selection
            else
                puts "Exit"
                #system "clear"
                return "Exit"
            end
end

def received_stock(parts)
    puts "Enter part name."
    part_name=gets.chomp
    if parts.any?{|part| part[:name] == part_name}
        puts "Enter #{part_name} received quantity."
        received_quantity=gets.chomp.to_i
        parts.each do |part|
            if part[:name] == part_name
                part[:quantity] += received_quantity
                puts "#{part[:quantity]} #{part_name} are now available in stock".green
            end
        end
        
    else
        puts "#{part_name} is an invalid item, would you like to add it? (y/n)".red
        answer = gets.chomp
        case answer
        when "y" 
            puts "For name confirmation!"
            add_part(parts, part_name)
        when "n"
            received_stock
        else 
            puts "Invalid input please enter (y/n)!"
        end
    end
end

def delete_part(parts)
    puts "Enter part name."
    part_name = gets.chomp
    if parts.any?{|part| part[:name] == part_name}
        puts "Are you sure you want to delete the #{part_name}?".red + "(y/n)"
        confirm = gets.chomp
        if confirm == "y"
            parts.delete_if{|part| part[:name] == part_name}
            puts "#{part_name} has been deleted.".red
        else
            puts "Request has been cancelled".green
        end
    else
        puts "Invalid input!".red
    end
end


parts = [
    {name: "alternator", quantity: 120},
    {name: "battery", quantity: 90},
    {name: "starter motor", quantity: 130},
    {name: "brakes", quantity: 110},
    {name: "distributor", quantity: 130},
    {name: "spark plug", quantity: 40},
    {name: "shock absorber", quantity: 100},
    {name: "ignition", quantity: 90},
    {name: "radiator", quantity: 150}
]
$prompt = TTY::Prompt.new

def menu_selection
    return $prompt.select("Select an option.",
    ["Inventory", "Search for Part", "Add Part", "Receive Stock", "Delete Part", "Exit"])
end

answer = ""
while answer != "Exit"
    answer = menu_selection
    case answer
        when "Inventory"
            inventory(parts)
        when "Search for Part"
            search_part(parts)
        when "Add Part"
            answer = add_part(parts, "")
        when "Receive Stock"
            received_stock(parts)
        when "Delete Part"
            delete_part(parts)
        else
            puts "Exit"
            # system "clear"
        end
    end