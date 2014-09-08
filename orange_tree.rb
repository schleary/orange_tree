class OrangeTree

  attr_accessor :tree_height, :life, :age, :orangeCount

  def initialize(tree_height, age, life)
    @tree_height = tree_height
    @life = life
    @age = age
    @orangeCount = count_the_oranges
  end

  def height
    return @tree_height
  end

  def one_year_passes
    @age += 1
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
    puts "The orange tree has died."
    @life = false
  end

  def count_the_oranges
    if @age > 108
      tree_death
    elsif @age > 50
      @orangeCount = 100 + (@age / 2)
    elsif @age > 3
      @orangeCount = @age * 2
    else
      @orangeCount = 0
    end
    return @orangeCount
  end

  def pickAnOrange
    @orangeCount -= 1
    if @orangeCount < 0
      return "That was a delicious orange!"
    else
      return "Sorry, there aren't any more oranges to pick this year."
    end
  end

end

orange = OrangeTree.new(20, 0, true)


# while orange.life == true do
#   puts "The orange tree is #{orange.age} years old, #{orange.tree_height} inches tall, and has #{orange.count_the_oranges} oranges."
#   orange.one_year_passes
#
# end

a = 0
while a < 7 do
  puts "The orange tree is #{orange.age} years old, #{orange.tree_height} inches tall, and has #{orange.count_the_oranges} oranges."
  # b = 1
  # while b < 5 do
  #   orange.pickAnOrange
  #   puts "***The orange tree is #{orange.age} years old, #{orange.tree_height} inches tall, and has #{orange.count_the_oranges} oranges."
  #    b += 1
  # end
  orange.one_year_passes
  a += 1
end

# orange.pickAnOrange
