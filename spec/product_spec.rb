require "rails_helper"

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should be saved' do
      @category = Category.new( id:4, name: 'something')
      @product = Product.new( name: 'something', price: 100, quantity: 100, category: @category )
      @product.save!

      expect(@product.name).to be_present
    end

    it 'should give an appropriate error when an the Product object name is set to nil' do
      @category = Category.new( id:4, name: 'something')
      @product = Product.new( name: nil, price: 100, quantity: 100, category: @category )
      begin
        @product.save!
      rescue => error
        expect(error.to_s).to include("Name can't be blank")
      end
    end

    it 'should give an appropriate error when an the Product object price is set to nil' do
      @category = Category.new( id:4, name: 'something')
      @product = Product.new( name: nil, price: nil, quantity: 100, category: @category )
      begin
        @product.save!
      rescue => error
        expect(error.to_s).to include("Price can't be blank")
      end
    end

    it 'should give an appropriate error when an the Product object quantity is set to nil' do
      @category = Category.new( id:4, name: 'something')
      @product = Product.new( name: nil, price: 100, quantity: nil, category: @category )
      begin
        @product.save!
      rescue => error
        expect(error.to_s).to include("Quantity can't be blank")
      end
    end
    
    it 'should give an appropriate error when an the Product object category is set to nil' do
      @category = Category.new( id:4, name: 'something')
      @product = Product.new( name: nil, price: 100, quantity: 100, category: nil )
      begin
        @product.save!
      rescue => error
        expect(error.to_s).to include("Category can't be blank")
      end
    end
  end
end