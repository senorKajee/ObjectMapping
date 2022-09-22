require 'csv'
class Person
  attr_accessor :first_name, :last_name, :person_id

  def initialize(first_name,last_name)
    @first_name = first_name
    @last_name = last_name
    @person_id = rand(1..999)
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

  def save_to_file
    File.open("#{person_id}-file.csv", "a") do |f|
      f.write(to_csv)
    end
  end
end
puts "first name last name"
first_name = gets.chomp()
last_name = gets.chomp()
person1 = Person.new(first_name,last_name)
puts person1.first_name
puts person1.last_name
puts person1.valid?
person1.save_to_file
