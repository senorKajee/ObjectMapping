require_relative 'person'

#person1 = Person.new('Bob','Thompson')
#
person0 = Person.read(293)
person0.last_name = "Gordon"
p person0.update
