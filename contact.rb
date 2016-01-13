require 'csv'
require 'pry'


# Represents a person in an address book.
class Contact

  attr_accessor :name, :email
  

  def initialize(name, email)
    CSV.open('./contacts.csv','a') do |csv|
        csv << [name, email]
    end
    # TODO: Assign parameter values to instance variables.
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def all
      puts "You have selected list"
      count = 0
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      CSV.foreach('./contacts.csv') do |row|
        line = "#{row[0]}, (#{row[1]})"
        count += 1
        puts "#{count}: #{line}"
      end
      puts"-------------------------------------------------------"
      puts "#{count} contacts on record"
      puts
      # binding.pry
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      Contact.new(name, email)

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
      puts "please enter contact full name:"
      name = gets.chomp
      puts "now enter contact's email"
      email = gets.chomp
      self.create(name, email)
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