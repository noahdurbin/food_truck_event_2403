require 'spec_helper'

RSpec.describe FoodTruck do
  describe 'initializes' do
    it 'exists' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck).to be_a(FoodTruck)
    end

    it 'has a name' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck.name).to eq("Rocky Mountain Pies")
    end

    it 'has an empty inventory hash' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck.inventory).to eq({})
    end
  end

  describe 'stocking methods' do
    it 'can check stock' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(food_truck.check_stock(item1)).to eq(0)
    end

    it 'can add stock' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      expect(food_truck.check_stock(item1)).to eq(0)

      food_truck.stock(item1, 30)
      expect(food_truck.check_stock(item1)).to eq(30)
    end
  end

  describe 'revenue methods' do
    it 'calculates potential revenue' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: '$5.30'}) 
      food_truck.stock(item1, 35)
      food_truck.stock(item2, 7)   

      expect(food_truck.potential_revenue).to eq(148.75)
    end
  end
end