require 'csv'
class Person
  attr_accessor :first_name, :last_name, :person_id
  attr_reader :file_name

  def initialize(first_name,last_name,person_id = rand(1..999))
    @first_name = first_name
    @last_name = last_name
    @person_id = person_id
    @file_name = "#{person_id}-file.csv"
  end

  def self.filename(person_id)
    "#{person_id}-file.csv"
  end

  def create
    if !File.exist?(file_name)
      save
    else
      puts "Can not create : File do exist for #{person_id}"
    end
  end

  def update
    if File.exist?(file_name)
      save
    else
      puts "Can not update : File do not exist"
      return false
    end

  end
  def self.destroy(person_id)
    file_name = Person.filename(person_id)
    if File.exist?(file_name)
      File.delete(file_name)
    else
      puts "Person record does not exits"
    end
  end

  def self.read(person_id)
    file_name = Person.filename(person_id)
    if File.exist?(file_name)
      File.open(file_name,'r') do |file|
        record = CSV.parse(file.read)[0]
        return Person.new(record[0],record[1],person_id)
      end
    else
      puts "Person record does not exits"
    end
  end

  def valid?
    (!first_name.nil? && first_name.length > 0) && (!last_name.nil? && last_name.length > 0)
  end
  def walk

  end

  def talk

  end

  def to_csv
    CSV.generate do |csv|
      csv << [first_name,last_name]
    end
  end

  def save
    save_file = File.open("#{person_id}-file.csv", "w") do |f|
      f.write(to_csv)
    end
    puts "File #{file_name} saved for employee with ID #{person_id}"
    return !save_file.nil?
  end
end

first_name = "Doom"
last_name = "Fist"
=begin
person1 = Person.new(first_name,last_name)
puts person1.first_name
puts person1.last_name
puts person1.valid?
person1.save
=end
