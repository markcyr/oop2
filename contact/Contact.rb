class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@next_id = 1000

  def initialize(first_name, last_name, email, note = 'N/A')
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@next_id

    @@next_id += 1
  end

  def self.create(first_name, last_name, email, note = 'N/A')
    new_contact = new(first_name, last_name, email, note)
    @@contacts << new_contact
    new_contact
  end


  def self.all
    @@contacts
  end



  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find(id)
    @@contacts.each do |contact|
       if id == contact.id
       return contact
       end
    end
  end

  def self.find_by(value)
    @@contacts.each do |contact|
       if value == contact.first_name
          return contact
        elsif value == contact.last_name
            return contact
        elsif value == contact.email
          return contact
       end
    end
       return false
  end

  def self.delete(id)
    @@contacts.each do |contact|
      if id == contact.id
        @@contacts.delete contact
      end
    end
  end

  def self.update(id,attribute,value)
    @@contacts.each do |contact|
      if id == contact.id
        case attribute
          when "first_name"
              contact.first_name = value
          when "last_name"
              contact.last_name = value
          when "email"
            contact.email = value
          end
      end
    end
  end

  def self.delete_all
    @@contacts = []
  end



  # Done via attr_accessor
  # def first_name
  #   @first_name
  # end
  #
  # def first_name=(new_name)
  #   @first_name = new_name
  # end
end


Contact.create("mark","cyr","mark@mark.com")
Contact.create("fred","jones","fred@jones.com")
Contact.create("bob","smith","bob@smith.com")
Contact.create("jim","hank","jim@hank.com")
