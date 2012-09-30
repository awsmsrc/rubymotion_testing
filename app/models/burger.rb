class Burger
  PROPERTIES = [:cheese, :ketchup, :salad, :double, :vegetarian]
  attr_accessor *PROPERTIES

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
    c += cheese_calories     if cheese
    c += ketchup_calories    if ketchup
    c += double_calorie      if double
    c += vegetarian_calories if vegetarian
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
    p += cheese_price  if cheese
    p += ketchup_price if ketchup
    p += salad_price   if salad
    p += double_price  if double
    sprintf('£%.2f', p)
  end
end
