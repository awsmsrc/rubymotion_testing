describe Burger do

  describe "with a standard burger" do

    before do
      @burger = Burger.new
    end

    it "repspond to base calories" do
      @burger.base_calories.should == 500
    end

    it "repspond to base price" do
      @burger.base_price.should == 2.0 
    end
  end

  describe "with set ingredients"  do
    before do
      @burger = Burger.with_ingredients([:cheese, :ketchup])
    end
    it "should initalize with ingredients" do
      @burger.cheese.should == true
      @burger.ketchup.should == true
      @burger.salad.should == false
      @burger.vegetarian.should == false
      @burger.double.should == false
    end

    it "should calculate calories" do
      @burger.total_calories.should == 630
    end

    it "should cost more with extra ingredients" do
      @burger.total_price.should == "£2.30"
    end
  end

  describe "veggie burger" do
    before do
      @burger = Burger.with_ingredients([:vegetarian])
    end

    it "should be low in calories" do
      @burger.total_calories.should == 400
    end

  end


end

