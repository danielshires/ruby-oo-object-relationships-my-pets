class Dog

  # code goes here

  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    # Here self refers to the instance
    # self.class becomes Cat
    # self.class.all is the class level method
    self.class.all << self
  end


  def self.all
    # Here self belongs to the class, becacuse you're in a class level method
    # self.class will refer to "Class" in Ruby
    # there is no method all 'all' in the "Class" class
    # self.class.all
    @@all
  end


end



