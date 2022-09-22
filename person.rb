require 'csv'
class Person
  attr_accessor :first_name, :last_name, :person_id

  def initialize(first_name,last_name,person_id = rand(1..999))
    @first_name = first_name
    @last_name = last_name
    @person_id = person_id
  end

  def self.read(person_id)
    file_name = "#{person_id}-file.csv"
    if File.exists?(file_name)
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
      csv << [first_name,last_name,person_id]
    end
  end

  def save
    File.open("#{person_id}-file.csv", "a") do |f|
      f.write(to_csv)
    end
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
