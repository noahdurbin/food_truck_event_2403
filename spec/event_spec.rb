require 'spec_helper'

RSpec.describe Event do
  describe 'initializes' do
    it 'exists' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event).to be_a(Event)
    end

    it 'has a name' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event.name).to eq("South Pearl Street Farmers Market")
    end

    it 'has an empty array of food trucks' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event.food_trucks).to eq([])
    end
  end

  describe 'food truck methods' do
    it 'can add food trucks to the food truck array' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      event.add_food_truck(food_truck1)

      expect(event.food_trucks).to eq([food_truck1])
    end

    it 'can return a list of the names of food trucks at event' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      event.add_food_truck(food_truck1)

      expect(event.food_truck_names).to eq(["Rocky Mountain Pies"])
    end

    it 'can return a list of food trucks that sell a specific item' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck3 = FoodTruck.new("Palisade Peach Shack")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      food_truck1.stock(item1, 35)
      food_truck3.stock(item1, 65)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck3)

      expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
    end
  end

  describe 'items at the event' do
    it 'can return a list of all items at the event' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Palisade Peach Shack")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      food_truck1.stock(item1, 35)
      food_truck2.stock(item2, 7)
      food_truck2.stock(item3, 25)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)

      expect(event.sorted_items_list).to eq(['Apple Pie (Slice)', 'Peach Pie (Slice)', 'Peach-Raspberry Nice Cream'])
    end

    it 'can return a hash of total inventory that reports the available inventory of all items sold at the event' do
      event = Event.new("South Pearl Street Farmers Market")
      food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      food_truck2 = FoodTruck.new("Palisade Peach Shack")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      food_truck1.stock(item1, 35)
      food_truck2.stock(item2, 7)
      food_truck2.stock(item3, 25)
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)

      expect(event.total_inventory).to eq(
        {item1 => {
          quantity: 35, 
          food_trucks: [food_truck1]
          }, 
          item2 => {
            quantity: 7, 
            food_trucks: [food_truck2]
          }, 
          item3 => {
            quantity: 25, 
            food_trucks: [food_truck2]
          }
        })
    end
  end
end