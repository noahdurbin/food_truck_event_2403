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
end