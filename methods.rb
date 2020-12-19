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
            puts "#{part_name.capitalize} are available. Quantity available in stock is:".yellow
            parts.each do |part|
                if part[:name] == part_name
                    puts part[:quantity].to_s.yellow
                end
            end
        else
            # this block from the code handles the error in case the user enters an invalid input or unavailable part name.
            puts "#{part_name} is an invalid and/or not available, please enter y to enter another part name or n to exit to the main menu."
            part_name = gets.chomp
            if part_name == "n"
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
    else
        return yes_or_no
    end   
end

def received_stock(parts)
    puts "Enter part name."
    part_name=gets.chomp
    # this if statemnt handles an error in case user entered a part name that doesn't exist in the stock so it offers to Add part instead.
    if parts.any?{|part| part[:name] == part_name}
        puts "Enter #{part_name} received quantity."
        received_quantity=gets.chomp.to_i
        # this if statement is to handle the error in case the user entered the integer 0 or a string and it doesn't count floats
        if received_quantity < 1
            puts "Please enter a valid quantity."
        end
        parts.each do |part|
            if part[:name] == part_name
                part[:quantity] += received_quantity
                puts "#{part[:quantity]} #{part_name} are currently available stock.".green
                return yes_or_no
            end
        end 
    else
        puts "#{part_name} is an invalid item, would you like to add part? (y/n)".red
        part_name = gets.chomp
        case part_name
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
            puts "Are you sure you want to remove #{part_name} from the stock?".red + "(y/n)"
            confirm = gets.chomp
            if confirm == "y"
                parts.delete_if{|part| part[:name] == part_name}
                puts "#{part_name} have been removed from stock.".red
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
    if y
        system "clear"
        return ""
    else
        puts "Exit"
        system "clear"
        return "Exit"
    end 
end