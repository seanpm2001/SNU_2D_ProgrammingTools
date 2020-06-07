# Taken from: https://en.wikipedia.org/wiki/Ruby_(programming_language)
''' # file info
File version: 1 (October 18th 2019)
Latest version: 1 (October 18th 2019)
First version: 1 (October 18th 2019)
File type: *.rbw (Ruby Source file)
Size: 06,.867 bytes (06,.867 Kilobytes)
Line count: 296
Language: Ruby
Ruby version: 2.6
'''
$ irb
irb(main):001:0> puts 'Hello, World'
Hello, World
 => nil
irb(main):002:0> 1+2
 => 3
 
puts 'Hello World!'

# Everything, including a literal, is an object, so this works:
-199.abs                                                 # => 199
'ice is nice'.length                                     # => 11
'ruby is cool.'.index('u')                               # => 1
"Nice Day Isn't It?".downcase.split('').uniq.sort.join   
# => " '?acdeinsty"

print 'Please type name >'
name = gets.chomp
puts "Hello #{name}."

puts 'Give me a number'
number = gets.chomp
puts number.to_i
output_number = number.to_i + 1
puts output_number.to_s + ' is a bigger number.'

a = "\nThis is a double-quoted string\n"
a = %Q{\nThis is a double-quoted string\n}
a = %{\nThis is a double-quoted string\n}
a = %/\nThis is a double-quoted string\n/
a = <<-BLOCK

This is a double-quoted string
BLOCK

var = 3.14159
"pi is #{var}"
=> "pi is 3.14159"

a = 'This is a single-quoted string'
a = %q{This is a single-quoted string}

a = [1, 'hi', 3.14, 1, 2, [4, 5]]

a[2]             # => 3.14
a.[](2)          # => 3.14
a.reverse        # => [[4, 5], 2, 1, 3.14, 'hi', 1]
a.flatten.uniq   # => [1, 'hi', 3.14, 2, 4, 5]

hash = Hash.new # equivalent to hash = {}
hash = { :water => 'wet', :fire => 'hot' } # makes the previous line redundant as we are now
                                           # assigning hash to a new, separate hash object
puts hash[:fire] # prints "hot"

hash.each_pair do |key, value|   # or: hash.each do |key, value|
  puts "#{key} is #{value}"
end
# returns {:water=>"wet", :fire=>"hot"} and prints:
# water is wet
# fire is hot

hash.delete :water                            # deletes the pair :water => 'wet' and returns "wet"
hash.delete_if {|key,value| value == 'hot'}   # deletes the pair :fire => 'hot' and returns {}

# Generate a random number and print whether it's even or odd.
if rand(100).even?
  puts "It's even"
else
  puts "It's odd"
end

{ puts 'Hello, World!' } # note the braces
# or:
do
  puts 'Hello, World!'
end

File.open('file.txt', 'w') do |file| # 'w' denotes "write mode"
  file.puts 'Wrote some text.'
end                                  # file is automatically closed here

File.readlines('file.txt').each do |line|
  puts line
end
# => Wrote some text.

# In an object instance variable (denoted with '@'), remember a block.
def remember(&a_block)
  @block = a_block
end

# Invoke the preceding method, giving it a block that takes a name.
remember {|name| puts "Hello, #{name}!"}

# Call the closure (note that this happens not to close over any free variables):
@block.call('Jon')   # => "Hello, Jon!"

proc {|arg| puts arg}
Proc.new {|arg| puts arg}
lambda {|arg| puts arg}
->(arg) {puts arg}         # introduced in Ruby 1.9

def create_set_and_get(initial_value=0) # note the default value of 0
  closure_value = initial_value
  [ Proc.new {|x| closure_value = x}, Proc.new { closure_value } ]
end

setter, getter = create_set_and_get  # returns two values
setter.call(21)
getter.call      # => 21

# Parameter variables can also be used as a binding for the closure,
# so the preceding can be rewritten as:

def create_set_and_get(closure_value=0)
  [ proc {|x| closure_value = x } , proc { closure_value } ]
end

def use_hello
  yield "hello"
end

# Invoke the preceding method, passing it a block.
use_hello {|string| puts string}  # => 'hello'

array = [1, 'hi', 3.14]
array.each {|item| puts item }
# prints:
# 1
# 'hi'
# 3.14

array.each_index {|index| puts "#{index}: #{array[index]}" }
# prints:
# 0: 1
# 1: 'hi'
# 2: 3.14

# The following uses a (a..b) Range
(3..6).each {|num| puts num }
# prints:
# 3
# 4
# 5
# 6

# The following uses a (a...b) Range
(3...6).each {|num| puts num }
# prints:
# 3
# 4
# 5

[1,3,5].inject(10) {|sum, element| sum + element}   # => 19

(1..10).collect {|x| x*x}  # => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

(1..5).map(&:to_f)  # => [1.0, 2.0, 3.0, 4.0, 5.0]

class Person
  attr_reader :name, :age
  def initialize(name, age)
    @name, @age = name, age
  end
  def <=>(person) # the comparison operator for sorting
    @age <=> person.age
  end
  def to_s
    "#{@name} (#{@age})"
  end
end

group = [
  Person.new("Bob", 33),
  Person.new("Chris", 16),
  Person.new("Ash", 23)
]

puts group.sort.reverse

# output: 
'''
Bob (33)
Ash (23)
Chris (16)
'''

# re-open Ruby's Time class
class Time
  def yesterday
    self - 86400
  end
end

today = Time.now               # => 2013-09-03 16:09:37 +0300
yesterday = today.yesterday    # => 2013-09-02 16:09:37 +0300

# re-open Ruby's Time class
module RelativeTimeExtensions
  refine Time do
    def half_a_day_ago
      self - 43200
    end
  end
end

module MyModule
  class MyClass
    # Allow the refinement to be used
    using RelativeTimeExtensions

    def window
      Time.now.half_a_day_ago
    end
  end
end

raise

raise "This is a message"

raise ArgumentError, "Illegal arguments!"

raise ArgumentError.new("Illegal arguments!")

class ParseError < Exception
  def initialize(input, line, pos)
    super "Could not parse '#{input}' at line #{line}, position #{pos}"
  end
end

raise ParseError.new("Foo", 3, 9)

begin
  # do something
rescue
  # handle exception
else
  # do this if no exception was raised
ensure
  # do this whether or not an exception was raised
end

begin
  # do something
rescue Exception
  # Exception handling code here.
  # Don't write only "rescue"; that only catches StandardError, a subclass of Exception.
end

begin
  # do something
rescue RuntimeError
  # handle only RuntimeError and its subclasses
end

begin
  # do something
rescue RuntimeError => e
  # handling, possibly involving e, such as "puts e.to_s"
end

begin
  # do something
rescue RuntimeError, Timeout::Error => e
  # handling, possibly involving e
end

COLORS = { black:   "000",
           red:     "f00",
           green:   "0f0",
           yellow:  "ff0",
           blue:    "00f",
           magenta: "f0f",
           cyan:    "0ff",
           white:   "fff" }

class String
  COLORS.each do |color,code|
    define_method "in_#{color}" do
      "<span style=\"color: ##{code}\">#{self}</span>"
    end
  end
end

"Hello, World!".in_blue
 => "<span style=\"color: #00f\">Hello, World!</span>"