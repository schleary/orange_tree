class OrangeGrove ##should take an array of trees

  attr_accessor :trees

  def initialize(height, age, boolean)
    create_grove(height, age, boolean)
  end

  def create_grove(height, age, boolean)
    @trees = []
    10.times do
      @trees.push(OrangeTree.new(height, age, boolean))
    end
  end


  def count_all_the_oranges
    total = 0
    @trees.each do |tree|
      total += tree.count_the_oranges
      puts "Total = #{total}"
    end
    return"Total trees = #{total}"
  end



  #OrangeTree = Struct.new(:tree_height, :life, :age)

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
end



treegrove = OrangeGrove.new(20, 4, true)
puts treegrove.count_all_the_oranges

#create all of the trees
#put trees in an array
#call grove with array








# while orange.life == true do
  # puts "The orange tree is #{orange.age} years old, #{orange.tree_height} inches tall, and has #{orange.count_the_oranges} oranges."
  # b = 1
  # while b < 5 do
  #   puts "***#{orange.pickAnOrange}"
  #   puts "***The orange tree is #{orange.age} years old, #{orange.tree_height} inches tall, and has #{orange.count_the_oranges} oranges."
  #    b += 1
  # end
  # orange.one_year_passes

#end
