require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should validate with all the validate fields' do
    @category = Category.create(name: "test category")
    @product = @category.products.create(name: 'productA', price_cents: 1000, quantity: 3)
    expect(@product).to be_valid
    end

    it 'should be invalid if name is missing' do
    @category = Category.create(name: "test category")
    @product = @category.products.create( price_cents: 1000, quantity: 3)
    expect(@product).to be_invalid
    end

    it 'should be invalid if price is missing' do
    @category = Category.create(name: "test category")
    @product = @category.products.create( name: 'productA', quantity: 3)
    expect(@product).to be_invalid
    end

    it 'should be invalid if quantity is missing' do
    @category = Category.create(name: "test category")
    @product = @category.products.create( name: 'productA', price_cents: 1000)
    expect(@product).to be_invalid
    end

    it 'should be invalid if catrgory is missing' do
    @product = Product.create(name: 'productA', price_cents: 1000, quantity: 3)
    expect(@product).to be_invalid
    end

  end
end