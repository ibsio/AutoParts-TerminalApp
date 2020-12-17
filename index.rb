require_relative ("./methods.rb")
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
    return yes_or_no
end

def search_part(parts)
    included = false
    while !included
        puts "Enter part name."
        part_name = gets.chomp
        
        if parts.any?{|part| part[:name] == part_name}
            included = true
            puts "#{part_name.capitalize} are available. Quantity available in stock is:".green
            parts.each do |part|
                if part[:name] == part_name
                    puts part[:quantity]
                end
            end
        else
            puts "#{part_name} is not available, please enter y to enter another part name or n to exit to the main menu.".red
            answer = gets.chomp
            if answer == "n"
               return menu_selection
            else
                puts "Confirm part name below."
            end
        end
    end
    return yes_or_no
end

def add_part(parts, part_name)
    part_name == ""
    puts "Enter part name."
    part_name = gets.chomp
    if parts.any?{|part| part[:name] == part_name}
        puts "Part already available in stock! Do you want to receive stock? (y/n)"
        answer=gets.chomp
        if answer == "y"
            puts "Part name confirmation."
            received_stock(parts)
        else
            puts "Retry with a valid part name."
        end
        return yes_or_no
    end
    puts "Enter #{part_name} received quantity."
    received_quantity = gets.chomp.to_i
    part = {name: part_name, quantity: received_quantity}
    parts.push(part)
    puts "#{received_quantity} #{part_name} has been added as a new part in stock".green
    sleep(1)
    puts "Print inventory? (y/n)"
    answer=gets.chomp
    if answer == "y"
        system "clear"
        puts "Printing inventory..."
        sleep(3)
        inventory(parts)
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
                return yes_or_no
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
            received_stock(parts)
        else 
            return yes_or_no
        end
    end
end

def delete_part(parts)
    included = false
    while !included
        puts "Enter part name."
        part_name = gets.chomp
        if parts.any?{|part| part[:name] == part_name}
            include = true
            puts "Are you sure you want to delete the #{part_name}?".red + "(y/n)"
            confirm = gets.chomp
            if confirm == "y"
                parts.delete_if{|part| part[:name] == part_name}
                puts "#{part_name} has been deleted.".red
                return yes_or_no
            else
                puts "Request has been cancelled".green
                return yes_or_no
            end
        else
            puts "#{part_name} is an invalid input, please enter y to enter another part name or n to exit to the main menu.".red
            answer = gets.chomp
                if answer == "n"
                return menu_selection
                else
                    puts "Confirm part name below."
                end
        end
    end
    return yes_or_no
end

def yes_or_no
    y = $prompt.yes?("Do you want to go back to the main menu?")

    if y #if answer is yes
        system "clear"
        return ""
        #menu_selection
    else
        puts "Exit"
        system "clear"
        return "Exit"
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
            answer = inventory(parts)
        when "Search for Part"
            answer = search_part(parts)
        when "Add Part"
            answer = add_part(parts, "")
        when "Receive Stock"
            answer = received_stock(parts)
        when "Delete Part"
            answer = delete_part(parts)
        else
            puts "Exit"
            system "clear"
        end
    end