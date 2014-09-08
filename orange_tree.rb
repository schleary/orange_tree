class OrangeTree

  attr_accessor :tree_height, :life, :age, :orangeCount, :picked_oranges

  def initialize(tree_height, age, life)
    @tree_height = tree_height
    @life = life
    @age = age
    @orangeCount = count_the_oranges
    @picked_oranges = 0
  end

  def orangeCount
    @orangeCount
  end

  def height
    return @tree_height
  end

  def one_year_passes
    @age += 1
    @picked_oranges = 0
    #tree grows quickly at first, and rate decreases over the years
    if @age < 5
      @tree_height += 10
    elsif @age < 10
      @tree_height += 5
    else
      @tree_height += 1
    end
  end

  def tree_death
    abort("The orange tree has died.")
    @life = false
  end

  def count_the_oranges
    if @age > 108
      tree_death
    elsif @age > 50
      @orangeCount = (100 + (@age / 2)) - @picked_oranges
    elsif @age > 3
      @orangeCount = (@age * 2) - @picked_oranges
    else
      @orangeCount = 0
    end
    return @orangeCount
  end

  def pickAnOrange
    if @orangeCount > 0
      @picked_oranges += 1
      return "That was a delicious orange!"
    elsif @age <=3
        return "Sorry, there aren't any oranges to pick yet."
    else
        return "Sorry, there aren't any more oranges to pick."
    end
  end

end

orange = OrangeTree.new(20, 0, true)


while orange.life == true do
  puts "The orange tree is #{orange.age} years old, #{orange.tree_height} inches tall, and has #{orange.count_the_oranges} oranges."
  b = 1
  while b < 5 do
    puts "***#{orange.pickAnOrange}"
    puts "***The orange tree is #{orange.age} years old, #{orange.tree_height} inches tall, and has #{orange.count_the_oranges} oranges."
     b += 1
  end
  orange.one_year_passes

end
##
