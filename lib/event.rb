class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks.push(food_truck)
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def sorted_items_list
    @food_trucks.flat_map do |food_truck|
      food_truck.inventory.map do |item, price|
        item.name
      end
    end.uniq.sort
  end

  def total_inventory
    total_inventory = Hash.new { |hash, key| hash[key] = {quantity: 0, food_trucks: []} }
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, amount|
        total_inventory[item][:quantity] += amount
        total_inventory[item][:food_trucks].push(food_truck)
      end
    end
    total_inventory
  end
end