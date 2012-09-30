describe ViewController do
  tests ViewController

  describe "with a standard burger" do
    before do
      @burger  = Burger.new
    end

    it "shows the correct price" do
      controller.view.viewByName('price_label').text.should == "Total Price #{@burger.total_price}"
    end
  end

  describe "with a cheese burger" do
    before do
      @cheese_burger  = Burger.with_ingredients([:cheese])
      flick "cheese_switch", to: :right
    end

    it "sets the switch to the correct position" do
      controller.view.viewByName('cheese_switch').on?.should == true
    end

    it "shows the correct price" do
      controller.view.viewByName('price_label').text.should == "Total Price #{@cheese_burger.total_price}"
    end
  end

  describe "order button resets the menu" do
    before do
      controller.burger = Burger.with_ingredients([:cheese])
      flick 'cheese_switch', to: :right
      tap 'order_button'
    end

    it "resets the cheese switch" do
      controller.view.viewByName('cheese_switch').on?.should == false
    end

    it "resets the total price" do
      controller.view.viewByName('price_label').text.should == "Total Price #{Burger.new.total_price}"
    end
  end
end
