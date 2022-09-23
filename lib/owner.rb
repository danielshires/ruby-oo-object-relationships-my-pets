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

class Owner
  # code goes here

  attr_reader :name, :species
  attr_accessor :all

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save  
  end

  def save
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  # 

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.select{ |dog| dog.mood = "happy" }
  end

  def feed_cats
    Cat.all.select{ |cat| cat.mood = "happy" }
  end

  def sell_pets
    Dog.all.select do|dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
    Cat.all.select do|dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

# owner = Owner.new("Timmy")

# dog_1 = Dog.new("Fido", owner)
# dog_2 = Dog.new("Snuffles", owner)
# dog_3 = Dog.new("Charley", owner)

# p owner.dogs