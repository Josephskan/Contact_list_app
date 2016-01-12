require 'csv'
require 'pry'


# Represents a person in an address book.
class Contact

  attr_accessor :name, :email
  

  def initialize(name, email)
    # TODO: Assign parameter values to instance variables.
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def all
      puts "You have selected list"
      list = 0
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      CSV.foreach('./contacts.csv') do |row|
        show = ''
        row.each do |word|
          if show == ''
            show <<("#{word}, ")
          else
            show <<("(#{word})")
          end
        end
        list += 1
        puts "#{list}: #{show}"
      end
      puts"-------------------------------------------------------"
      puts "#{list} contacts on record"
      puts
      # binding.pry
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
    end

    def start_up
    puts
    puts "Here is a list of available commands:"
    puts
    puts "\tnew - Create a new contact"
    puts
    puts "\tlist - List all contacts"
    puts
    puts "\tshow - Show a contact"
    puts
    puts "\tsearch - Search contacts"
    puts

    cmd = gets.chomp
    case cmd
    when "new"
      self.create ()
    when "list"
      self.all
    when "show"
      self.find()
    when "search"
      self.search()
    end
  end

  end

  

  Contact.start_up

end