class ViewController < UIViewController

  MENUITEMS = [:ketchup, :salad, :cheese, :double, :vegetarian]

  MENUITEMS.each do |property|
    attr_accessor property
  end

  attr_accessor :burger, :button, :price_label

  def loadView
    super
    views = NSBundle.mainBundle.loadNibNamed "menu_view", owner:self, options:nil
    self.view = views[0]
  end

  def viewDidLoad
    super
    self.burger = Burger.new
    link_to_menu_items
    add_order_button
    add_price_label
    display_price
  end

  def add_price_label
    @price_label = UILabel.new
    @price_label.frame = [[20,320],[260,40]]
    @price_label.textAlignment = UITextAlignmentRight
    @price_label.accessibilityLabel = "price_label"
    self.view.addSubview(@price_label)
  end

  def add_order_button
    @button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button.setTitle("Order", forState:UIControlStateNormal)
    @button.accessibilityLabel = "order_button"
    @button.frame = [[20,380],[280,40]]
    @button.addTarget(self, action:'submit_order', forControlEvents:UIControlEventTouchUpInside)
    self.view.addSubview(@button)
  end

  def submit_order
    self.burger = Burger.new
    display_price
    reset_switches
    CYAlert.show('Your Burger will Arrive Shortly!')
  end

  def reset_switches
    (1..5).each do |i|
      switch = self.view.viewWithTag i
      switch.on = false
    end
  end

  def burger_changed
    self.burger = Burger.with_ingredients([].tap do |a|
      MENUITEMS.each do |item|
        switch = self.send("#{item.to_s}")
        a << item if switch.on?
      end
    end)
    display_price
  end

  def display_price
    self.price_label.text = "Total Price #{self.burger.total_price}"
  end

  def link_to_menu_items
    MENUITEMS.each_with_index do |item, index|
      self.send("#{item.to_s}=", view.viewWithTag("#{index+1}"))
      switch =  self.send("#{item.to_s}")
      switch.addTarget(self, action:'burger_changed', forControlEvents:UIControlEventValueChanged)
      switch.accessibilityLabel = "#{item}_switch"
    end
  end

end
