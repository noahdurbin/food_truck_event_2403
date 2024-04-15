class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item].nil?
      0
    else
      @inventory[item]
    end
  end

  def stock(item, amount)
    @inventory[item] = amount
  end

  def potential_revenue
    @inventory.sum do |item, amount|
      item.price.delete("$").to_f * amount
    end
  end
end