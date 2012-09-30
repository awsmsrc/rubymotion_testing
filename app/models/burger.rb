class Burger
  PROPERTIES = [:cheese, :ketchup, :salad, :double, :vegetarian]

  PROPERTIES.each { |prop|
    attr_accessor prop
  }

  def self.with_ingredients(ingredients = [])
    this = self.new
    PROPERTIES.each do |prop|
      this.send("#{prop.to_s}=", ingredients.include?(prop))
    end
    this 
  end

  def base_calories
    500
  end

  def cheese_calories
    100
  end

  def ketchup_calories
    30
  end

  def double_calories
    200
  end

  def vegetarian_calories
    -100
  end

  def total_calories
    c = base_calories
    c += cheese_calories if self.cheese 
    c += ketchup_calories if self.ketchup 
    c += double_calorie if self.double 
    c += vegetarian_calories if self.vegetarian 
    c
  end

  def base_price
    2.0
  end

  def cheese_price
    0.2
  end

  def ketchup_price
    0.1
  end

  def salad_price
    0.1
  end

  def double_price
    1
  end

  def total_price
    p = base_price
    p += cheese_price if self.cheese 
    p += ketchup_price if self.ketchup 
    p += salad_price if self.salad
    p += double_price if self.double 
    sprintf("£%.2f", p)
  end

end
