require 'rspec'
require 'dessert'
# require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Bobby") }
  let(:dessert) { Dessert.new("chocolate", 10, chef) }


  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("chocolate")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "ten", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before { dessert.add_ingredient("sugar") }
    before { dessert.add_ingredient("milk") }
    before { dessert.add_ingredient("flour") }

    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to eq(["sugar", "milk", "flour"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(dessert.ingredients).to_not eq(["sugar", "milk", "flour"])
    end
  end

  describe "#eat" do
    before { dessert.eat(5) }
    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(5)
    end
    # before { dessert.eat(6) }
    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(6) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef chef the Great Baker")
      expect(dessert.serve).to eq("Chef chef the Great Baker has made 10 chocolates!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
