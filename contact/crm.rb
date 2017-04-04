class Crm
require './Contact.rb'

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
    user_selected = gets.to_i
    call_option(user_selected)
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_existing_contact
    when 4 then display_all_contacts
    when 5 then seach_contact
    when 6 then exit
    # Finish off the rest for 3 through 6
    # To be clear, the methods add_new_contact and modify_existing_contact
    # haven't been implemented yet
    end
  end


  def add_new_contact
  puts "you selected add new"
  puts "Add contact info"
      first_name = gets.chomp
      last_name = gets.chomp
      email = gets.chomp
     Contact.create(first_name,last_name,email)
  end

  def modify_existing_contact
    user_id = gets.to_i
    attribute = gets.chomp.to_s
    user_value = gets.chomp.to_s
    Contact.update(user_id, attribute, user_value)
end


  def delete_existing_contact
    puts "Delete a contact by the id"
      id = gets.to_i
      Contact.delete(id)
  end

  def display_all_contacts
    puts "Display all users"
    contacts =  Contact.all
    contacts.each do |contact|
      puts "id : #{contact.id}, name :#{contact.full_name}, email : #{contact.email}"
    end

  end

  def seach_contact
    puts "What do you want to search"
    user_value = gets.chomp.to_s
    contact =  Contact.find_by(user_value)
    if  contact
      puts "id : #{contact.id}, name :#{contact.full_name}, email : #{contact.email}"
    else
      puts "Can't find it"
    end
  end

end
