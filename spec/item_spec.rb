require 'spec_helper'

RSpec.describe Item do
  describe 'initializes' do
    it 'exists' do
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      expect(item1).to be_a(Item)
    end
  end
end